using Newtonsoft.Json;
using System.Xml.Serialization;

namespace InterviewChallenge.ApiService.Models.ApplicationSettings;

public class AppSettings
{
    [JsonIgnore]
    [XmlIgnore]
    public IConfiguration ConfigurationBase { get; set; } = default!;

    public Logging Logging { get; set; }
    public Featuremanagement FeatureManagement { get; set; }
    public Opentelemetry OpenTelemetry { get; set; }
    [JsonIgnore]
    [XmlIgnore]
    public string RedactionKey { get; set; }
    public Connectionstrings ConnectionStrings { get; set; }
    public Jwt Jwt { get; set; }
    public string AllowedHosts { get; set; }
}