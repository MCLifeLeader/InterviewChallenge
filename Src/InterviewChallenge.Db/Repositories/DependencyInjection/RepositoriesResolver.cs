using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

namespace InterviewChallenge.Db.Repositories.DependencyInjection;

public static class RepositoriesResolver
{
    public static void RegisterDependencies(IServiceCollection service, string connectionString)
    {
        #region Database Repositories

        //service.AddDbContext<StartupExampleContext>(options =>
        //{
        //    options.UseSqlServer(connectionString);

        //    if (service.BuildServiceProvider().GetService<IFeatureManager>().IsEnabledAsync(FeatureFlags.SQL_DEBUGGER).Result)
        //    {
        //        options.EnableSensitiveDataLogging();
        //        options.EnableDetailedErrors();
        //        options.UseLoggerFactory(LoggerSupport.GetLoggerFactory());
        //    }
        //});

        //service.AddScoped<IStartupExampleContext, StartupExampleContext>();

        //service.AddScoped<IAgencyRepository, AgencyRepository>();
        //service.AddScoped<IAuthenticationLogRepository, AuthenticationLogRepository>();
        //service.AddScoped<IAuthenticationStatusRepository, AuthenticationStatusRepository>();
        //service.AddScoped<IUserToAgencyRepository, UserToAgencyRepository>();

        #endregion
    }
}