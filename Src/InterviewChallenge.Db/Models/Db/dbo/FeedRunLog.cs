﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using InterviewChallenge.Data.Models.Db.dboSchema;


namespace InterviewChallenge.Data.Models.Db.dboSchema;

public partial class FeedRunLog
{
    public long Id { get; set; }

    public int SyndicationSourceId { get; set; }

    public string FeedPayload { get; set; }

    public int HttpStatus { get; set; }

    public long ContentLength { get; set; }

    public DateTime DateCreated { get; set; }

    public virtual SyndicationSource SyndicationSource { get; set; }
}