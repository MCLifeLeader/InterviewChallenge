namespace InterviewChallenge.Common.Models;

public class ChunkedObjectData<TEntityType>
{
    /// <summary>
    /// The collection of records to be returned
    /// </summary>
    public IList<TEntityType> EntityList { get; set; } = new List<TEntityType>();

    /// <summary>
    /// The number of records found in the table
    /// </summary>
    public long TotalItemCount { get; set; }

    /// <summary>
    /// 
    /// </summary>
    // ReSharper disable once UnusedMember.Global
    public long TotalPageCount
    {
        get
        {
            return EntityList is { Count: > 0 } ? EntityList.Count : 0;
        }
    }

    /// <summary>
    /// The specified Page Size
    /// </summary>
    public int PageSize { get; set; }

    /// <summary>
    /// The next id to use when chunking
    /// </summary>
    // ReSharper disable once UnusedMember.Global
    public TEntityType? NextStartingId
    {
        get
        {
            return EntityList is { Count: > 0 } ? EntityList.Last() : default;
        }
    }
}