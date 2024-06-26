using InterviewChallenge.Common.Repositories;
using InterviewChallenge.Db.Repositories.Interfaces;

namespace InterviewChallenge.Db.Repositories.Db;

public abstract class InterviewChallengeRepositoryBase : RepositoryBase<InterviewChallengeContext>
{
    // ReSharper disable once ConvertToPrimaryConstructor
    protected InterviewChallengeRepositoryBase(IInterviewChallengeContext dbContext) : base(dbContext)
    {
    }
}