using System.Net;
using InterviewChallenge.Api.Data;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;

namespace InterviewChallenge.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class WeatherForecastController : ControllerBase
    {
        private readonly IWeatherForecastService _weatherForecastService;
        private readonly ILogger<WeatherForecastController> _logger;

        public WeatherForecastController(ILogger<WeatherForecastController> logger, IWeatherForecastService weatherService)
        {
            _logger = logger;
            _weatherForecastService = weatherService;
        }

        [HttpGet("WeatherForecast")]
        [SwaggerResponse((int)HttpStatusCode.OK, "List of Weather Forecast data", typeof(IEnumerable<WeatherForecast>))]
        public IEnumerable<WeatherForecast> Get()
        {
            _logger.LogInformation("Empty");
            return _weatherForecastService.GetForecastAsync(DateTime.UtcNow).Result;
        }

        [HttpGet("WeatherForecast/{location}")]
        [SwaggerResponse((int)HttpStatusCode.OK, "List of Weather Forecast data", typeof(IEnumerable<WeatherForecast>))]
        public IEnumerable<WeatherForecast> Get([FromRoute] string? location)
        {
            _logger.LogInformation(location);
            return _weatherForecastService.GetForecastAsync(DateTime.UtcNow, location).Result;
        }

        [HttpPost("WeatherForecast")]
        [SwaggerResponse((int)HttpStatusCode.OK, "Weather Forecast data", typeof(WeatherForecast))]
        public WeatherForecast Post([FromBody] WeatherForecast weatherForecast)
        {
            _logger.LogInformation(weatherForecast.ToString());
            return _weatherForecastService.PostForecastAsync(weatherForecast).Result;
        }

        [HttpPut("WeatherForecast")]
        [SwaggerResponse((int)HttpStatusCode.OK, "Weather Forecast data", typeof(WeatherForecast))]
        public WeatherForecast Put([FromRoute] long id, [FromBody] WeatherForecast weatherForecast)
        {
            _logger.LogInformation($"{id} - {weatherForecast}");
            return _weatherForecastService.PutForecastAsync(id, weatherForecast).Result;
        }

        [HttpDelete("WeatherForecast/{id}")]
        [SwaggerResponse((int)HttpStatusCode.OK, "Weather Forecast data", typeof(WeatherForecast))]
        public WeatherForecast Delete([FromRoute] long id)
        {
            _logger.LogInformation($"{id}");
            return _weatherForecastService.DeleteForecastAsync(id).Result;
        }
    }
}