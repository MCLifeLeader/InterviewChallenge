namespace InterviewChallenge.Api.Data;

public interface IWeatherForecastService
{
    Task<List<WeatherForecast>> GetForecastAsync(DateTime startDate);
    Task<List<WeatherForecast>> GetForecastAsync(DateTime startDate, string? location);
    Task<WeatherForecast> PostForecastAsync(WeatherForecast weatherForecast);
    Task<WeatherForecast> PutForecastAsync(long id, WeatherForecast weatherForecast);
    Task<WeatherForecast> DeleteForecastAsync(long id);
}