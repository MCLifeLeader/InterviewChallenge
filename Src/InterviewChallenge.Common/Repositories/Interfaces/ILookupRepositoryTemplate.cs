using InterviewChallenge.Common.Models;
using System.Linq.Expressions;

namespace InterviewChallenge.Common.Repositories.Interfaces;

/// <summary>
/// Represents a generic repository template for *R** of CRUD operations.
/// </summary>
/// <typeparam name="TEntityType"></typeparam>
/// <typeparam name="TKeyType"></typeparam>
public interface ILookupRepositoryTemplate<TEntityType, in TKeyType>
{
    /// <summary>
    /// Retrieves an entity by its unique identifier.
    /// </summary>
    /// <param name="key1">The unique identifier of the entity.</param>
    /// <returns>The entity with the specified unique identifier.</returns>
    Task<TEntityType> GetEntityByIdAsync(TKeyType key1);

    /// <summary>
    /// Retrieves all entities.
    /// </summary>
    /// <returns>A list of all entities.</returns>
    Task<IList<TEntityType>> GetAllAsync();

    /// <summary>
    /// Retrieves entities by chunking based on the specified key and page size.
    /// </summary>
    /// <param name="key1">The key used for chunking.</param>
    /// <param name="pageSize">The number of entities per chunk.</param>
    /// <returns>A chunked object data containing the entities.</returns>
    Task<ChunkedObjectData<TEntityType>> GetByChunkingAsync(TKeyType key1, int pageSize);

    /// <summary>
    /// Retrieves entities by paging based on the specified page number and page size.
    /// </summary>
    /// <param name="pageNumber">The page number.</param>
    /// <param name="pageSize">The number of entities per page.</param>
    /// <returns>A chunked object data containing the entities.</returns>
    Task<ChunkedObjectData<TEntityType>> GetByPagingAsync(int pageNumber, int pageSize);

    /// <summary>
    /// Queries entities based on the specified filter.
    /// </summary>
    /// <param name="filter">The filter expression.</param>
    /// <returns>An IQueryable representing the filtered entities.</returns>
    IQueryable<TEntityType> Query(Expression<Func<TEntityType, bool>> filter);

    /// <summary>
    /// Retrieves entities as an IQueryable.
    /// </summary>
    /// <returns>An IQueryable representing the entities.</returns>
    IQueryable<TEntityType> GetAsQueryable();
}
