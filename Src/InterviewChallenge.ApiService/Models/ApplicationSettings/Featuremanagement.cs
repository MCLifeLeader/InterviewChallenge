namespace InterviewChallenge.ApiService.Models.ApplicationSettings;

public class Featuremanagement
{
    public bool DisplayConfiguration { get; set; }
    public bool InformationEndpoints { get; set; }
    public bool OpenTelemetryEnabled { get; set; }
    public bool SqlDebugger { get; set; }
    public bool SwaggerEnabled { get; set; }
}