using InterviewChallenge.Api.Data;
using Microsoft.OpenApi.Models;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Configuration
    .SetBasePath(Directory.GetCurrentDirectory())
    .AddJsonFile("appsettings.json", true, true)
    .AddJsonFile($"appsettings.{builder.Environment.EnvironmentName}.json", true)
    .AddEnvironmentVariables();


builder.Services.AddSingleton<IConfigurationBuilder, ConfigurationBuilder>();
builder.Services.AddTransient<IWeatherForecastService, WeatherForecastService>();

builder.Services.AddControllers();

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new ApiInfo().GetApiVersion());
    c.EnableAnnotations();
});

var app = builder.Build();

// Configure the HTTP request pipeline.
app.UseSwagger();
app.UseSwaggerUI(c => { c.SwaggerEndpoint("/swagger/v1/swagger.json", "Interview Api"); });

app.UseHttpsRedirection();
app.UseRouting();

app.UseAuthorization();

app.MapControllers();

app.UseEndpoints(endpoints =>
{
    endpoints.MapControllerRoute(
        "default",
        "{controller}/{action=Index}/{id?}");
});

app.UseDefaultFiles();
app.UseStaticFiles();

app.Run();

internal class ApiInfo
{
    /// <summary>
    /// 
    /// </summary>
    /// <returns></returns>
    public OpenApiInfo GetApiVersion()
    {
        return new OpenApiInfo
        {
            Title = "Interview Challenge Api",
            Version = "v1",
            Description = $"A restful API as an interview challenge. Build Version: {GetType().Assembly.GetName().Version}"
        };
    }
}