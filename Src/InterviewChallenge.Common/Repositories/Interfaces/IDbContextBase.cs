namespace InterviewChallenge.Common.Repositories.Interfaces;

/// <summary>
/// Represents the base interface for a database context.
/// </summary>
public interface IDbContextBase
{
    /// <summary>
    /// Asynchronously saves all changes made in this context to the underlying database.
    /// </summary>
    /// <returns>A task that represents the asynchronous save operation. The task result contains the number of objects written to the underlying database.</returns>
    Task<int> SaveChangesAsync();

    /// <summary>
    /// Reloads the specified entity from the database.
    /// </summary>
    /// <typeparam name="TEntity">The type of the entity.</typeparam>
    /// <param name="entity">The entity to reload.</param>
    void Reload<TEntity>(TEntity entity) where TEntity : class;

    /// <summary>
    /// Clears the tracked state of the specified entity.
    /// </summary>
    /// <typeparam name="TEntity">The type of the entity.</typeparam>
    /// <param name="entity">The entity to clear the state of.</param>
    void ClearState<TEntity>(TEntity entity) where TEntity : class;

    /// <summary>
    /// Sets the automatic detect changes configuration of the database context.
    /// </summary>
    /// <param name="setAutoDetect">A boolean value indicating whether to enable or disable automatic detect changes.</param>
    void SetDbContextConfigurationAutoDetectChanges(bool setAutoDetect);
}
