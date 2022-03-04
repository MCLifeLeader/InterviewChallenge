using Microsoft.OpenApi.Models;

namespace InterviewChallenge.Api.Model;

public class ApiInfo
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
            Description = $"A restful API as an interview challenge. Build Version: {GetType().Assembly.GetName().Version}. " +
                          $"The challenge is to implement automation code that will validate as much of the functional behaviors of each endpoint " +
                          $"as you can. "
        };
    }
}