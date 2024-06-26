using InterviewChallenge.Common.Repositories.Interfaces;

namespace InterviewChallenge.Db.Repositories.Interfaces;

/// <summary>
///     Base interface context used to bind all of the database repositories into a unit of work
/// </summary>
public interface IInterviewChallengeContext : IDbContextBase
{
}