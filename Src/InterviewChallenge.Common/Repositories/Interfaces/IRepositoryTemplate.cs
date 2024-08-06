namespace InterviewChallenge.Common.Repositories.Interfaces;

/// <summary>
/// Represents a generic repository template for C*UD of CRUD operations.
/// </summary>
/// <typeparam name="TEntityType">The type of the entity.</typeparam>
public interface IRepositoryTemplate<TEntityType>
{
    /// <summary>
    /// Adds a single entity asynchronously.
    /// </summary>
    /// <param name="entity">The entity to add.</param>
    /// <returns>A task representing the asynchronous operation.</returns>
    Task AddAsync(TEntityType entity);

    /// <summary>
    /// Adds a range of entities asynchronously.
    /// </summary>
    /// <param name="entities">The list of entities to add.</param>
    /// <returns>A task representing the asynchronous operation.</returns>
    Task AddRangeAsync(IList<TEntityType> entities);

    /// <summary>
    /// Deletes an entity.
    /// </summary>
    /// <param name="entity">The entity to delete.</param>
    void Delete(TEntityType entity);

    /// <summary>
    /// Updates an entity.
    /// </summary>
    /// <param name="entity">The entity to update.</param>
    void Update(TEntityType entity);

    /// <summary>
    /// Updates a range of entities.
    /// </summary>
    /// <param name="entities">The list of entities to update.</param>
    void UpdateRange(IList<TEntityType> entities);
}
