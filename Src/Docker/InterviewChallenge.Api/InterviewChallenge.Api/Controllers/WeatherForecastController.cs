using System.Net;
using InterviewChallenge.Api.Model;
using InterviewChallenge.Api.Service;
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
        public async Task<ActionResult<IEnumerable<WeatherForecast>>> GetWeatherData()
        {
            _logger.LogInformation("Empty");
            return await _weatherForecastService.GetForecastAsync(DateTime.UtcNow);
        }

        [HttpGet("WeatherForecast/{location}")]
        [SwaggerResponse((int)HttpStatusCode.OK, "List of Weather Forecast data", typeof(IEnumerable<WeatherForecast>))]
        public async Task<ActionResult<IEnumerable<WeatherForecast>>> GetWeatherDataByLocation([FromRoute] string? location)
        {
            _logger.LogInformation(location);
            return await _weatherForecastService.GetForecastAsync(DateTime.UtcNow, location);
        }

        [HttpPost("WeatherForecast")]
        [SwaggerResponse((int)HttpStatusCode.OK, "Weather Forecast data", typeof(WeatherForecast))]
        public async Task<ActionResult<WeatherForecast>> PostWeatherData([FromBody] WeatherForecast weatherForecast)
        {
            _logger.LogInformation(weatherForecast.ToString());
            return await _weatherForecastService.PostForecastAsync(weatherForecast);
        }

        [HttpPut("WeatherForecast")]
        [SwaggerResponse((int)HttpStatusCode.OK, "Weather Forecast data", typeof(WeatherForecast))]
        public async Task<ActionResult<WeatherForecast>> PutWeatherData([FromRoute] long id, [FromBody] WeatherForecast weatherForecast)
        {
            _logger.LogInformation($"{id} - {weatherForecast}");
            return await _weatherForecastService.PutForecastAsync(id, weatherForecast);
        }

        [HttpDelete("WeatherForecast/{id}")]
        [SwaggerResponse((int)HttpStatusCode.OK, "Weather Forecast data", typeof(WeatherForecast))]
        public async Task<ActionResult<WeatherForecast>> DeleteWeatherData([FromRoute] long id)
        {
            _logger.LogInformation($"{id}");
            return await _weatherForecastService.DeleteForecastAsync(id);
        }
    }
}