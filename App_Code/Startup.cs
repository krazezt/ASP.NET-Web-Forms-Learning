using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Gacha.Startup))]
namespace Gacha
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
