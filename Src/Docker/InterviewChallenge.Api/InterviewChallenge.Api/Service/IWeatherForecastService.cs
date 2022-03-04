using InterviewChallenge.Api.Model;

namespace InterviewChallenge.Api.Service;

public interface IWeatherForecastService
{
    Task<List<WeatherForecast>> GetForecastAsync(DateTime startDate);
    Task<List<WeatherForecast>> GetForecastAsync(DateTime startDate, string? location);
    Task<WeatherForecast> PostForecastAsync(WeatherForecast weatherForecast);
    Task<WeatherForecast> PutForecastAsync(long id, WeatherForecast weatherForecast);
    Task<WeatherForecast> DeleteForecastAsync(long id);
}