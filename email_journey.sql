SELECT
        _Sent.AccountID,
        _Sent.OYBAccountID,
        _Sent.JobID,
        _Sent.ListID,
        _Sent.BatchID,
        _Sent.SubscriberID,
        _Sent.SubscriberKey,
        _Sent.EventDate AS SentEventDate,
        _Sent.Domain,
        _Sent.TriggererSendDefinitionObjectID,
        _Sent.TriggeredSendCustomerKey,
        _Open.EventDate AS OpenEventDate,
        _Click.EventDate AS ClickEventDate,
        _Click.URL,
        _Click.LinkName,
        _Click.LinkContent,
        _Bounce.EventDate AS BounceEventDate,
        _Bounce.BounceCategoryID,
        _Bounce.BounceCategory,
        _Bounce.BounceSubcategoryID,
        _Bounce.BounceSubcategory,
        _Bounce.BounceTypeID,
        _Bounce.BounceType,
        _Bounce.SMTPBounceReason,
        _Bounce.SMTPMessage,
        _Bounce.SMTPCode,
        _Unsubscribe.EventDate AS UnsubscribeEventDate,
        _Complaint.EventDate AS ComplaintEventDate,
        _BusinessUnitUnsubscribes.BusinessUnitID,
        _BusinessUnitUnsubscribes.UnsubDateUTC,
        _BusinessUnitUnsubscribes.UnsubReason,
        _Subscribers.DateUndeliverable,
        _Subscribers.DateJoined,
        _Subscribers.DateUnsubscribed AS SubscribersDateUnsubscribed,
        _Subscribers.EmailAddress,
        _Subscribers.BounceCount,
        _Subscribers.SubscriberType AS SubscribersSubscriberType,
        _Subscribers.Status AS SubscribersStatus,
        _Subscribers.Locale,
        _Job.AccountUserID,
        _Job.EmailID,
        _Job.FromName,
        _Job.FromEmail,
        _Job.SchedTime,
        _Job.PickupTime,
        _Job.DeliveredTime,
        _Job.EventID,
        _Job.IsMultipart,
        _Job.JobType,
        _Job.JobStatus,
        _Job.ModifiedBy,
        _Job.ModifiedDate,
        _Job.EmailName,
        _Job.EmailSubject,
        _Job.IsWrapped,
        _Job.TestEmailAddr,
        _Job.Category,
        _Job.BccEmail,
        _Job.OriginalSchedTime,
        _Job.CreatedDate AS JobCreatedDate,
        _Job.CharacterSet,
        _Job.IPAddress,
        _Job.SalesForceTotalSubscriberCount,
        _Job.SalesForceErrorSubscriberCount,
        _Job.SendType,
        _Job.DynamicEmailSubject,
        _Job.SuppressTracking,
        _Job.SendClassificationType,
        _Job.SendClassification,
        _Job.ResolveLinksWithCurrentData,
        _Job.EmailSendDefinition,
        _Job.DeduplicateByEmail,
        _JourneyActivity.VersionID,
        _JourneyActivity.ActivityID,
        _JourneyActivity.ActivityName,
        _JourneyActivity.ActivityExternalKey,
        _JourneyActivity.JourneyActivityObjectID,
        _JourneyActivity.ActivityType,
        _Journey.JourneyID,
        _Journey.JourneyName,
        _Journey.VersionNumber,
        _Journey.CreatedDate AS JourneyCreatedDate,
        _Journey.LastPublishedDate,
        _Journey.JourneyStatus
FROM _Sent
LEFT JOIN _Open 
        ON _Sent.JobID = _Open.JobID 
        AND _Sent.ListID = _Open.ListID 
        AND _Sent.BatchID = _Open.BatchID 
        AND _Sent.SubscriberID = _Open.SubscriberID 
        AND _Open.IsUnique = 1
LEFT JOIN _Click 
        ON _Sent.JobID = _Click.JobID 
        AND _Sent.ListID = _Click.ListID 
        AND _Sent.BatchID = _Click.BatchID 
        AND _Sent.SubscriberID = _Click.SubscriberID 
        AND _Click.IsUnique = 1
LEFT JOIN _Bounce 
        ON _Sent.JobID = _Bounce.JobID 
        AND _Sent.ListID = _Bounce.ListID 
        AND _Sent.BatchID = _Bounce.BatchID 
        AND _Sent.SubscriberID = _Bounce.SubscriberID 
        AND _Bounce.IsUnique = 1
LEFT JOIN _Unsubscribe 
        ON _Sent.JobID = _Unsubscribe.JobID 
        AND _Sent.ListID = _Unsubscribe.ListID 
        AND _Sent.BatchID = _Unsubscribe.BatchID 
        AND _Sent.SubscriberID = _Unsubscribe.SubscriberID 
        AND _Unsubscribe.IsUnique = 1
LEFT JOIN _Complaint 
        ON _Sent.JobID = _Complaint.JobID 
        AND _Sent.ListID = _Complaint.ListID 
        AND _Sent.BatchID = _Complaint.BatchID 
        AND _Sent.SubscriberID = _Complaint.SubscriberID 
        AND _Complaint.IsUnique = 1
LEFT JOIN _BusinessUnitUnsubscribes 
        ON _Sent.SubscriberID = _BusinessUnitUnsubscribes.SubscriberID
LEFT JOIN _Subscribers 
        ON _Sent.SubscriberID = _Subscribers.SubscriberID
LEFT JOIN _Job 
        ON _Sent.JobID = _Job.JobID
LEFT JOIN _JourneyActivity 
        ON _Sent.TriggererSendDefinitionObjectID = _JourneyActivity.JourneyActivityObjectID
LEFT JOIN _Journey 
        ON _JourneyActivity.VersionID = _Journey.VersionID