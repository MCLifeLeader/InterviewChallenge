using System.Text.Json.Serialization;
using System.Xml.Serialization;

namespace InterviewChallenge.Web.Models.ApplicationSettings;

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
    public string AllowedHosts { get; set; }
}