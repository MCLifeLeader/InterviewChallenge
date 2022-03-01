namespace InterviewChallenge.Api.Data
{
    public class WeatherForecastService : IWeatherForecastService
    {
        private static readonly string[] summaries = new[]
        {
            "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
        };

        private static readonly string[] locations = new[]
        {
            "United States", "Canada", "United Kingdom", "Mexico", "Germany", "Russia", "South Africa", "Japan", "India", "Brazil"
        };

        public Task<List<WeatherForecast>> GetForecastAsync(DateTime startDate)
        {
            return GetForecastAsync(startDate, null);
        }

        public Task<List<WeatherForecast>> GetForecastAsync(DateTime startDate, string? location)
        {
            return Task.FromResult(Enumerable.Range(1, 5).Select(index => new WeatherForecast
            {
                Id = Random.Shared.Next(),
                Date = startDate.AddDays(index),
                TemperatureC = Random.Shared.Next(-20, 55),
                Summary = summaries[Random.Shared.Next(summaries.Length)],
                Location = !string.IsNullOrEmpty(location) ? location : locations[Random.Shared.Next(locations.Length)]
            }).ToList());
        }

        public Task<WeatherForecast> PostForecastAsync(WeatherForecast weatherForecast)
        {
            return Task.FromResult(weatherForecast = new WeatherForecast()
            {
                Id = DateTime.UtcNow.Ticks,
                Date = weatherForecast.Date,
                Location = weatherForecast.Location,
                Summary = weatherForecast.Summary,
                TemperatureC = weatherForecast.TemperatureC
            });
        }

        public Task<WeatherForecast> PutForecastAsync(long id, WeatherForecast weatherForecast)
        {
            return Task.FromResult(weatherForecast = new WeatherForecast()
            {
                Date = weatherForecast.Date,
                Id = id,
                Location = weatherForecast.Location,
                Summary = weatherForecast.Summary,
                TemperatureC = weatherForecast.TemperatureC
            });
        }

        public Task<WeatherForecast> DeleteForecastAsync(long id)
        {
            return Task.FromResult( new WeatherForecast()
            {
                Id = id,
                Date = DateTime.UtcNow.AddDays(Random.Shared.Next(-30, 30)),
                TemperatureC = Random.Shared.Next(-20, 55),
                Summary = summaries[Random.Shared.Next(summaries.Length)],
                Location = locations[Random.Shared.Next(locations.Length)],
            });
        }
    }
}