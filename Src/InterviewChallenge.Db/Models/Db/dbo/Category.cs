﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using InterviewChallenge.Data.Models.Db.dboSchema;


namespace InterviewChallenge.Data.Models.Db.dboSchema;

public partial class Category
{
    public int Id { get; set; }

    public bool? IsActive { get; set; }

    public string Name { get; set; }

    public virtual ICollection<SyndicationFeedToCategory> SyndicationFeedToCategories { get; set; } = new List<SyndicationFeedToCategory>();

    public virtual ICollection<SyndicationToCategory> SyndicationToCategories { get; set; } = new List<SyndicationToCategory>();
}