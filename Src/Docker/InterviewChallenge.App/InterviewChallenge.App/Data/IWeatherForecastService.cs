namespace InterviewChallenge.App.Data;

public interface IWeatherForecastService
{
    Task<List<WeatherForecast>> GetForecastAsync();
    Task<List<WeatherForecast>> GetForecastAsync(string? location);
}