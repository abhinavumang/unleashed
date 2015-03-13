using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
//specific to configuration 
using System.Configuration;
using System.Web.Configuration;
using System.Web.Security;
namespace WebUtils
{
    /// <summary> 
    /// Contains methods for Encrypting and decrypting connectionStrings
    /// section in web.config 
    /// current encryption configuration model is Rsa,
    /// it is feasible to change this to DataProtectionConfigurationProvider 
    /// </summary> 

    public partial class EncryptDecrypt : System.Web.UI.Page 
    {
        //Get Application path using HttpContext 
        public static string path = HttpContext.Current.
        Request.ApplicationPath;
        /// <summary> 
        /// Encrypt web.config connectionStrings
        /// section using Rsa protected configuration
        /// provider model 
        /// </summary> 
        #region Encrypt method
        public static void EncryptConnString()
        {
            Configuration config = WebConfigurationManager.
            OpenWebConfiguration(path);
            ConfigurationSection section =
            config.GetSection("connectionStrings");
            if (!section.SectionInformation.IsProtected)
            {
                section.SectionInformation.ProtectSection
                ("MyUserDataProtectionConfigurationProvider");
                
                config.Save();
            }
        }
        #endregion
        /// <summary> 
        /// Decrypts connectionStrings section in 
        ///web.config using Rsa provider model 
        /// </summary> 
        #region Decrypt method
        public static void DecryptConnString()
        {
            Configuration config = WebConfigurationManager.
            OpenWebConfiguration(path);
            ConfigurationSection section =
            config.GetSection("connectionStrings");
            if (section.SectionInformation.IsProtected)
            {
                section.SectionInformation.UnprotectSection();
                config.Save();
            }
        }
        #endregion
        protected void btnEN_Click(object sender, EventArgs e)
        {
            EncryptDecrypt.EncryptConnString();
        }
        protected void btnDE_Click(object sender, EventArgs e)
        {
            EncryptDecrypt.DecryptConnString();
        }
    }
}