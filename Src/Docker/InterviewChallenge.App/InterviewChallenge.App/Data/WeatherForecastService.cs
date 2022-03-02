using RestSharp;

namespace InterviewChallenge.App.Data
{
    public class WeatherForecastService : IWeatherForecastService
    {
        private readonly ConfigurationManager _configurationManager;

        public WeatherForecastService(ConfigurationManager configuration)
        {
            _configurationManager = configuration;
        }

        public async Task<List<WeatherForecast>> GetForecastAsync()
        {
            RestClient client = new RestClient();
            RestRequest request = new RestRequest()
            {
                Resource = $"{_configurationManager.GetSection("AppSettings")["DataUrl"]}api/WeatherForecast/WeatherForecast",
                RequestFormat = DataFormat.Json
            };
            request.RequestFormat = DataFormat.Json;

            RestResponse<List<WeatherForecast>> response = await client.ExecuteAsync<List<WeatherForecast>>(request);

            return response.Data!;
        }

        public async Task<List<WeatherForecast>> GetForecastAsync(string? location)
        {
            RestClient client = new RestClient();
            RestRequest request = new RestRequest()
            {
                Resource = $"{_configurationManager.GetSection("AppSettings")["DataUrl"]}api/WeatherForecast/WeatherForecast",
                RequestFormat = DataFormat.Json
            };
            request.AddParameter("location", location);

            RestResponse<List<WeatherForecast>> response = await client.ExecuteAsync<List<WeatherForecast>>(request);

            return response.Data!;
        }
    }
}