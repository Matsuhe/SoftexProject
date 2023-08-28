using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Data;
using Microsoft.EntityFrameworkCore;

namespace Api
{
    public class Startup : IStartup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers();
            // Início conexão com o banco de dados
            
            string? stringDeConexao = Configuration.GetConnectionString("conexaoMySQL");
            if (stringDeConexao != null)
            {
                var serverVersion = ServerVersion.AutoDetect(stringDeConexao);
                services.AddDbContext<DataContext>(opt => opt.UseMySql(stringDeConexao, serverVersion));
            }
            else
            {
                throw new ArgumentException("A string de conexão é inválida ou nula!");
            }
            //string stringDeConexao = Configuration.GetConnectionString("conexaoMySQL");
            //services.AddDbContext<DataContext>(opt => opt.UseMySql(stringDeConexao, ServerVersion.AutoDetect(stringDeConexao)));
            // Término da conexão com o banco de dados
            services.AddEndpointsApiExplorer();
            services.AddSwaggerGen();
        }
        public void Configure(WebApplication app, IWebHostEnvironment environment)
        {
            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
            }

            app.UseHttpsRedirection();

            app.UseAuthorization();

            app.MapControllers();
        }
    }

    public interface IStartup{
        IConfiguration Configuration { get; }
        void Configure(WebApplication app, IWebHostEnvironment environment);
        void ConfigureServices(IServiceCollection services);    
    }

    public static class StartupExtensions{
        public static WebApplicationBuilder UseStartup<TStartup>(this WebApplicationBuilder WebAppBuider) where TStartup : IStartup{
            var startup = Activator.CreateInstance(typeof(TStartup),WebAppBuider.Configuration) as IStartup;
            if (startup == null) throw new ArgumentException("Classe Startup.cs inválida!");
            startup.ConfigureServices(WebAppBuider.Services);
            var app = WebAppBuider.Build();
            startup.Configure(app,app.Environment);
            app.Run();
            return WebAppBuider;
        }
    }

}