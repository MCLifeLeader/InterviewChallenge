using InterviewChallenge.Data.Repositories.Db;
using Microsoft.EntityFrameworkCore;

namespace InterviewChallenge.Db.Repositories.Db;

public class InterviewChallengeContext : InterviewChallengeContainer
{
    public InterviewChallengeContext(DbContextOptions dbContextOptions)
        : base(dbContextOptions)
    {
    }

    public InterviewChallengeContext(DbContextOptions<InterviewChallengeContainer> dbContextOptions)
        : base(dbContextOptions)
    {
    }

    public InterviewChallengeContext(string connectionString)
        : base(GetOptionsGeneric(connectionString))
    {
    }
}