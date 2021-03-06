﻿using System;
using System.Collections.Generic;

namespace Okurdostu.Data.Model
{
    public partial class Need
    {
        public Need()
        {
            CreatedOn = DateTime.Now;
            IsSentForConfirmation = false;
            IsCompleted = false;
            IsConfirmed = false;
            IsRemoved = false;
            IsWrong = false;

            NeedItem = new HashSet<NeedItem>();
            NeedLike = new HashSet<NeedLike>();
            NeedComment = new HashSet<NeedComment>();
        }

        public long Id { get; set; }
        public long UserId { get; set; }
        public string Title { get; set; }
        public string FriendlyTitle { get; set; }
        public string Description { get; set; }
        public decimal? TotalCollectedMoney { get; set; }
        public decimal? TotalCharge { get; set; }
        public bool IsRemoved { get; set; }
        public bool IsSentForConfirmation { get; set; }
        public bool IsConfirmed { get; set; }
        public bool IsCompleted { get; set; }
        public DateTime? CreatedOn { get; private set; }
        public DateTime? StartedOn { get; set; }
        public DateTime? FinishedOn { get; set; }
        public DateTime? LastCheckOn { get; set; }
        public bool IsWrong { get; set; }

        public bool ShouldBeCheck
        {
            get
            {
                if (LastCheckOn == null) //oluşturulmasından sonra hiç kontrol edilmediyse
                {
                    return true;
                }
                var PassedTime = DateTime.Now - LastCheckOn;

                return PassedTime.Value.TotalMinutes > 60; // en son kontrolunun üzerinden 60 dakika'dan fazla geçtiyse tekrar kontrol edilmeli.
            }
        }
        public decimal? CompletedPercentage => 100 - (TotalCharge - TotalCollectedMoney) * 100 / TotalCharge;

        public virtual User User { get; set; }
        public virtual ICollection<NeedComment> NeedComment { get; set; }
        public virtual ICollection<NeedItem> NeedItem { get; set; }
        public virtual ICollection<NeedLike> NeedLike { get; set; }
    }
}
