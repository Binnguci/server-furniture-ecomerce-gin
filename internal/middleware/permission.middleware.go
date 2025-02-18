package middleware

import (
	"github.com/gin-gonic/gin"
	"net/http"
	"server-car-rental-ecommerce-gin/global"
)

func PermissionMiddleware(requiredPermissions ...string) gin.HandlerFunc {
	return func(c *gin.Context) {
		userID, exists := c.Get("userID")
		if !exists {
			c.JSON(http.StatusUnauthorized, gin.H{"error": "Unauthorized"})
			c.Abort()
			return
		}

		permissions, err := getUserPermissions(userID.(string))
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "Error retrieving permissions"})
			c.Abort()
			return
		}

		for _, requiredPermission := range requiredPermissions {
			if !hasPermission(requiredPermission, permissions) {
				c.JSON(http.StatusForbidden, gin.H{"error": "Forbidden"})
				c.Abort()
				return
			}
		}

		c.Next()
	}
}

func getUserPermissions(userID string) ([]string, error) {
	var permissions []string
	err := global.Pdb.
		Table("permissions p").
		Select("p.name").
		Joins("JOIN role_permissions rp ON p.id = rp.permission_id").
		Joins("JOIN roles r ON rp.role_id = r.id").
		Joins("JOIN users u ON u.role_id = r.id").
		Where("u.id = ?", userID).
		Pluck("p.name", &permissions).Error

	if err != nil {
		return nil, err
	}
	return permissions, nil
}

func hasPermission(permission string, permissions []string) bool {
	for _, p := range permissions {
		if p == permission {
			return true
		}
	}
	return false
}
