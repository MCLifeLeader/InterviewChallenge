using System.Net;
using InterviewChallenge.Api.Model;
using InterviewChallenge.Api.Service;
using Microsoft.AspNetCore.Mvc;
using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.Annotations;

namespace InterviewChallenge.Api.Controllers;

[ApiController]
[Route("api/[controller]")]
public class InformationController : ControllerBase
{
    private readonly IWeatherForecastService _weatherForecastService;
    private readonly ILogger<WeatherForecastController> _logger;

    public InformationController(ILogger<WeatherForecastController> logger, IWeatherForecastService weatherService)
    {
        _logger = logger;
        _weatherForecastService = weatherService;
    }

    [HttpGet("Challenge")]
    [SwaggerResponse((int)HttpStatusCode.OK, "Interview Challenge", typeof(OpenApiInfo))]
    public ActionResult<OpenApiInfo> GetChallenge()
    {
        return new ApiInfo().GetApiVersion();
    }
}