#nullable disable
using InterviewChallenge.Common.Repositories;
using InterviewChallenge.Db.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;

// ReSharper disable All
namespace InterviewChallenge.Data.Repositories.Db;

/// <summary>
///     This context should be kept in favor of the auto generated code.
///     In the auto generated code for ..\*Container.cs remove the ": DbContext" reference and the generated
///     constructors.
/// </summary>
public partial class InterviewChallengeContainer : DbContextBase<InterviewChallengeContainer>, IInterviewChallengeContext
{
    public InterviewChallengeContainer(DbContextOptions dbContextOptions)
        : base(dbContextOptions)
    {
    }
}
// ReSharper restore All