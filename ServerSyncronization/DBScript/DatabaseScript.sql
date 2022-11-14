USE [HRDemo]
GO
/****** Object:  UserDefinedTableType [dbo].[sDepartements_BulkType]    Script Date: 11/14/2022 11:33:54 AM ******/
CREATE TYPE [dbo].[sDepartements_BulkType] AS TABLE(
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[OfficeId] [int] NULL,
	PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedTableType [dbo].[sEmployee_BulkType]    Script Date: 11/14/2022 11:33:54 AM ******/
CREATE TYPE [dbo].[sEmployee_BulkType] AS TABLE(
	[Id] [int] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[Address] [nvarchar](4000) NULL,
	[PhoneNumber] [varchar](50) NULL,
	PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedTableType [dbo].[sEmployeeDetails_BulkType]    Script Date: 11/14/2022 11:33:54 AM ******/
CREATE TYPE [dbo].[sEmployeeDetails_BulkType] AS TABLE(
	[Id] [int] NOT NULL,
	[BasicSalary] [decimal](18, 0) NULL,
	[Location] [nvarchar](50) NULL,
	[DepartmentId] [int] NULL,
	[EmployeeId] [int] NULL,
	PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[Departements]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departements](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[OfficeId] [int] NULL,
 CONSTRAINT [PK_Departements] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[Address] [nvarchar](4000) NULL,
	[PhoneNumber] [varchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeCertificate]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeCertificate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[ExpiryDate] [datetime] NULL,
	[EmployeeId] [int] NOT NULL,
 CONSTRAINT [PK_EmployeeCertificate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeDetails]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BasicSalary] [decimal](18, 0) NULL,
	[Location] [nvarchar](50) NULL,
	[DepartmentId] [int] NULL,
	[EmployeeId] [int] NULL,
 CONSTRAINT [PK_EmployeeDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeEducation]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeEducation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[GraudateDate] [datetime] NULL,
	[School] [nvarchar](250) NULL,
	[EmployeeID] [int] NULL,
 CONSTRAINT [PK_EmployeeEducation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Offices]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Offices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scope_info]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scope_info](
	[sync_scope_name] [nvarchar](100) NOT NULL,
	[sync_scope_schema] [nvarchar](max) NULL,
	[sync_scope_setup] [nvarchar](max) NULL,
	[sync_scope_version] [nvarchar](10) NULL,
	[sync_scope_last_clean_timestamp] [bigint] NULL,
	[sync_scope_properties] [nvarchar](max) NULL,
 CONSTRAINT [PKey_scope_info_server] PRIMARY KEY CLUSTERED 
(
	[sync_scope_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[scope_info_client]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scope_info_client](
	[sync_scope_id] [uniqueidentifier] NOT NULL,
	[sync_scope_name] [nvarchar](100) NOT NULL,
	[sync_scope_hash] [nvarchar](100) NOT NULL,
	[sync_scope_parameters] [nvarchar](max) NULL,
	[scope_last_sync_timestamp] [bigint] NULL,
	[scope_last_server_sync_timestamp] [bigint] NULL,
	[scope_last_sync_duration] [bigint] NULL,
	[scope_last_sync] [datetime] NULL,
	[sync_scope_errors] [nvarchar](max) NULL,
	[sync_scope_properties] [nvarchar](max) NULL,
 CONSTRAINT [PKey_scope_info_client] PRIMARY KEY CLUSTERED 
(
	[sync_scope_id] ASC,
	[sync_scope_name] ASC,
	[sync_scope_hash] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tDepartements]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tDepartements](
	[Id] [int] NOT NULL,
	[update_scope_id] [uniqueidentifier] NULL,
	[timestamp] [timestamp] NULL,
	[timestamp_bigint]  AS (CONVERT([bigint],[timestamp])) PERSISTED,
	[sync_row_is_tombstone] [bit] NOT NULL,
	[last_change_datetime] [datetime] NULL,
 CONSTRAINT [PK_tDepartements] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tEmployee]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tEmployee](
	[Id] [int] NOT NULL,
	[update_scope_id] [uniqueidentifier] NULL,
	[timestamp] [timestamp] NULL,
	[timestamp_bigint]  AS (CONVERT([bigint],[timestamp])) PERSISTED,
	[sync_row_is_tombstone] [bit] NOT NULL,
	[last_change_datetime] [datetime] NULL,
 CONSTRAINT [PK_tEmployee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tEmployeeDetails]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tEmployeeDetails](
	[Id] [int] NOT NULL,
	[update_scope_id] [uniqueidentifier] NULL,
	[timestamp] [timestamp] NULL,
	[timestamp_bigint]  AS (CONVERT([bigint],[timestamp])) PERSISTED,
	[sync_row_is_tombstone] [bit] NOT NULL,
	[last_change_datetime] [datetime] NULL,
 CONSTRAINT [PK_tEmployeeDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[scope_info] ([sync_scope_name], [sync_scope_schema], [sync_scope_setup], [sync_scope_version], [sync_scope_last_clean_timestamp], [sync_scope_properties]) VALUES (N'DefaultScope', N'{"t":[{"n":"Employee","s":"","op":"SqlSyncProvider, Dotmim.Sync.SqlServer.SqlSyncProvider","c":[{"n":"Id","dt":"6","iu":true,"ia":true,"seed":1,"step":1,"ps":true,"p1":10,"odb":"Int","oty":"int","db":11},{"n":"FirstName","dt":"17","an":true,"iuc":true,"ml":50,"o":1,"odb":"NVarChar","oty":"nvarchar","db":23},{"n":"LastName","dt":"17","an":true,"iuc":true,"ml":50,"o":2,"odb":"NVarChar","oty":"nvarchar","db":23},{"n":"DateOfBirth","dt":"13","an":true,"o":3,"p1":10,"odb":"Date","oty":"date","db":6},{"n":"Address","dt":"17","an":true,"iuc":true,"ml":4000,"o":4,"odb":"NVarChar","oty":"nvarchar","db":23},{"n":"PhoneNumber","dt":"17","an":true,"ml":50,"o":5,"odb":"VarChar","oty":"varchar","db":23}],"pk":["Id"]},{"n":"EmployeeDetails","s":"","op":"SqlSyncProvider, Dotmim.Sync.SqlServer.SqlSyncProvider","c":[{"n":"Id","dt":"6","iu":true,"ia":true,"seed":1,"step":1,"ps":true,"p1":10,"odb":"Int","oty":"int","db":11},{"n":"BasicSalary","dt":"15","an":true,"o":1,"ps":true,"p1":18,"ss":true,"odb":"Decimal","oty":"decimal","db":7},{"n":"Location","dt":"17","an":true,"iuc":true,"ml":50,"o":2,"odb":"NVarChar","oty":"nvarchar","db":23},{"n":"DepartmentId","dt":"6","an":true,"o":3,"ps":true,"p1":10,"odb":"Int","oty":"int","db":11},{"n":"EmployeeId","dt":"6","an":true,"o":4,"ps":true,"p1":10,"odb":"Int","oty":"int","db":11}],"pk":["Id"]},{"n":"Departements","s":"","op":"SqlSyncProvider, Dotmim.Sync.SqlServer.SqlSyncProvider","c":[{"n":"Id","dt":"6","iu":true,"ia":true,"seed":1,"step":1,"ps":true,"p1":10,"odb":"Int","oty":"int","db":11},{"n":"Name","dt":"17","an":true,"iuc":true,"ml":50,"o":1,"odb":"NVarChar","oty":"nvarchar","db":23},{"n":"OfficeId","dt":"6","an":true,"o":2,"ps":true,"p1":10,"odb":"Int","oty":"int","db":11}],"pk":["Id"]}],"r":[{"n":"FK_EmployeeDetails_Employee","pks":[{"c":"Id","t":"Employee","s":""}],"cks":[{"c":"EmployeeId","t":"EmployeeDetails","s":""}]}],"f":[{"t":"Employee","p":[{"n":"OfficeId","t":"Departements"}],"w":[{"c":"OfficeId","t":"Departements","p":"OfficeId"}],"j":[{"je":0,"tbl":"EmployeeDetails","ltbl":"EmployeeDetails","lcol":"EmployeeId","rtbl":"Employee","rcol":"Id"},{"je":0,"tbl":"Departements","ltbl":"Departements","lcol":"Id","rtbl":"EmployeeDetails","rcol":"DepartmentId"}],"cw":[]}]}', N'{"tbls":[{"tn":"Employee","sn":"","cols":[]},{"tn":"EmployeeDetails","sn":"","cols":[]},{"tn":"Departements","sn":"","cols":[]}],"fils":[{"tn":"Employee","j":[{"je":0,"tn":"EmployeeDetails","ltn":"EmployeeDetails","lcn":"EmployeeId","rtn":"Employee","rcn":"Id"},{"je":0,"tn":"Departements","ltn":"Departements","lcn":"Id","rtn":"EmployeeDetails","rcn":"DepartmentId"}],"cw":[],"p":[{"n":"OfficeId","tn":"Departements","sn":null}],"w":[{"tn":"Departements","cn":"OfficeId","pn":"OfficeId"}]}],"spp":"s","sps":"","tf":"","ts":"t","ttp":"t","tts":""}', N'0.9.7', NULL, NULL)
GO
ALTER TABLE [dbo].[tDepartements] ADD  DEFAULT ((0)) FOR [sync_row_is_tombstone]
GO
ALTER TABLE [dbo].[tEmployee] ADD  DEFAULT ((0)) FOR [sync_row_is_tombstone]
GO
ALTER TABLE [dbo].[tEmployeeDetails] ADD  DEFAULT ((0)) FOR [sync_row_is_tombstone]
GO
ALTER TABLE [dbo].[EmployeeCertificate]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeCertificate_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[EmployeeCertificate] CHECK CONSTRAINT [FK_EmployeeCertificate_Employee]
GO
ALTER TABLE [dbo].[EmployeeDetails]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeDetails_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[EmployeeDetails] CHECK CONSTRAINT [FK_EmployeeDetails_Employee]
GO
ALTER TABLE [dbo].[EmployeeEducation]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeEducation_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[EmployeeEducation] CHECK CONSTRAINT [FK_EmployeeEducation_Employee]
GO
/****** Object:  StoredProcedure [dbo].[sDepartements_bulkdelete]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sDepartements_bulkdelete]
	@sync_min_timestamp bigint,
	@sync_scope_id uniqueidentifier,
	@changeTable [dbo].[sDepartements_BulkType] READONLY
AS
BEGIN
-- use a temp table to store the list of PKs that successfully got deleted
declare @dms_changed TABLE ([Id] int,  PRIMARY KEY ([Id]));

;WITH [changes] AS (
	SELECT [p].[Id], [p].[Name], [p].[OfficeId], 
	[side].[update_scope_id] as [sync_update_scope_id], [side].[timestamp] as [sync_timestamp], [side].[sync_row_is_tombstone] as [sync_row_is_tombstone]
	FROM @changeTable [p]
	LEFT JOIN [tDepartements] [side] ON 	[p].[Id] = [side].[Id]
	)
DELETE [Departements]
OUTPUT DELETED.[Id]
INTO @dms_changed 
FROM [Departements] [base]
JOIN [changes] ON [changes].[Id] = [base].[Id]
WHERE [changes].[sync_timestamp] <= @sync_min_timestamp OR [changes].[sync_timestamp] IS NULL OR [changes].[sync_update_scope_id] = @sync_scope_id;

-- Since the delete trigger is passed, we update the tracking table to reflect the real scope deleter
UPDATE [side] SET
	sync_row_is_tombstone = 1, 
	update_scope_id = @sync_scope_id,
	last_change_datetime = GETUTCDATE()
FROM [tDepartements] [side]
JOIN @dms_changed [t] on [t].[Id] = [side].[Id]


--Select all ids not inserted / deleted / updated as conflict
SELECT  [t].[Id] ,[t].[Name] ,[t].[OfficeId]
FROM @changeTable [t]
WHERE NOT EXISTS (
	 SELECT  [Id]	 FROM @dms_changed [i]
	 WHERE  [t].[Id] = [i].[Id]	)

END
GO
/****** Object:  StoredProcedure [dbo].[sDepartements_bulkupdate]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sDepartements_bulkupdate]
	@sync_min_timestamp bigint,
	@sync_scope_id uniqueidentifier,
	@changeTable [dbo].[sDepartements_BulkType] READONLY
AS
BEGIN
-- use a temp table to store the list of PKs that successfully got updated/inserted
declare @dms_changed TABLE ([Id] int,  PRIMARY KEY ( [Id]));


SET IDENTITY_INSERT [Departements] ON;

;WITH [changes] AS (
	SELECT [p].[Id], [p].[Name], [p].[OfficeId], 
	[side].[update_scope_id] as [sync_update_scope_id], [side].[timestamp] as [sync_timestamp], [side].[sync_row_is_tombstone] as [sync_row_is_tombstone]
	FROM @changeTable [p]
	LEFT JOIN [tDepartements] [side] ON 
	[p].[Id] = [side].[Id]	)
MERGE [Departements] AS [base]
USING [changes] on [changes].[Id] = [base].[Id]
WHEN MATCHED AND ([changes].[sync_timestamp] <= @sync_min_timestamp OR [changes].[sync_timestamp] IS NULL OR [changes].[sync_update_scope_id] = @sync_scope_id) THEN

	UPDATE SET
	[Name] = [changes].[Name]
	, [OfficeId] = [changes].[OfficeId]
WHEN NOT MATCHED BY TARGET AND ([changes].[sync_timestamp] <= @sync_min_timestamp OR [changes].[sync_timestamp] IS NULL) THEN

	INSERT
	([Id], [Name], [OfficeId])
	VALUES ([changes].[Id], [changes].[Name], [changes].[OfficeId])
	OUTPUT  INSERTED.[Id]
	INTO @dms_changed; -- populates the temp table with successful PKs


SET IDENTITY_INSERT [Departements] ON;

-- Since the update trigger is passed, we update the tracking table to reflect the real scope updater
UPDATE [side] SET
	[update_scope_id] = @sync_scope_id,
	[sync_row_is_tombstone] = 0,
	[last_change_datetime] = GETUTCDATE()
FROM [tDepartements] [side]
JOIN @dms_changed [t] on [t].[Id] = [side].[Id]

--Select all ids not inserted / deleted / updated as conflict
SELECT  [t].[Id] ,[t].[Name] ,[t].[OfficeId]
FROM @changeTable [t]
WHERE NOT EXISTS (
	 SELECT  [Id]	 FROM @dms_changed [i]
	 WHERE  [t].[Id] = [i].[Id]	)

END
GO
/****** Object:  StoredProcedure [dbo].[sDepartements_changes]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sDepartements_changes]
	@sync_min_timestamp bigint = 0,
	@sync_scope_id uniqueidentifier = NULL
AS
BEGIN
SELECT DISTINCT	[side].[Id], 
	[base].[Name], 
	[base].[OfficeId], 
	[side].[sync_row_is_tombstone] as [sync_row_is_tombstone], 
	[side].[update_scope_id] as [sync_update_scope_id]
FROM [Departements] [base]
RIGHT JOIN [tDepartements] [side] ON [base].[Id] = [side].[Id]
WHERE (
	[side].[timestamp] > @sync_min_timestamp
	AND ([side].[update_scope_id] <> @sync_scope_id OR [side].[update_scope_id] IS NULL)
)

END
GO
/****** Object:  StoredProcedure [dbo].[sDepartements_delete]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sDepartements_delete]
	@Id int,
	@sync_scope_id uniqueidentifier,
	@sync_force_write int,
	@sync_min_timestamp bigint,
	@sync_row_count int OUTPUT
AS
BEGIN
-- use a temp table to store the list of PKs that successfully got updated/inserted
declare @dms_changed TABLE ([Id] int,  PRIMARY KEY ( [Id]));

DELETE [Departements]
OUTPUT DELETED.[Id] INTO @dms_changed -- populates the temp table with successful deleted row
FROM [Departements] [base]
LEFT JOIN [tDepartements] [side] ON [base].[Id] = [side].[Id]
WHERE ([side].[timestamp] <= @sync_min_timestamp OR [side].[timestamp] IS NULL OR [side].[update_scope_id] = @sync_scope_id OR @sync_force_write = 1)
AND ([base].[Id] = @Id);

SET @sync_row_count = 0;
-- Since the update trigger is passed, we update the tracking table to reflect the real scope updater
UPDATE [side] SET
	[update_scope_id] = @sync_scope_id,
	[sync_row_is_tombstone] = 1,
	[last_change_datetime] = GETUTCDATE()
FROM [tDepartements] [side]
JOIN @dms_changed [t] on [t].[Id] = [side].[Id]

SET @sync_row_count = @@ROWCOUNT;

END
GO
/****** Object:  StoredProcedure [dbo].[sDepartements_deletemetadata]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sDepartements_deletemetadata]
	@Id int,
	@sync_row_timestamp bigint,
	@sync_row_count int OUTPUT
AS
BEGIN
SET @sync_row_count = 0;

DELETE [side] FROM [tDepartements] [side]
WHERE [side].[timestamp] < @sync_row_timestamp

SET @sync_row_count = @@ROWCOUNT;

END
GO
/****** Object:  StoredProcedure [dbo].[sDepartements_initialize]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sDepartements_initialize]
	@sync_min_timestamp bigint = NULL
AS
BEGIN
SELECT
	[base].[Id], 
	[base].[Name], 
	[base].[OfficeId]
FROM [Departements] [base]
LEFT JOIN [tDepartements] [side] ON [base].[Id] = [side].[Id]
WHERE (
	([side].[timestamp] > @sync_min_timestamp OR  @sync_min_timestamp IS NULL)
)

END
GO
/****** Object:  StoredProcedure [dbo].[sDepartements_reset]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sDepartements_reset]
	@sync_row_count int OUTPUT
AS
BEGIN
SET @sync_row_count = 0;

DISABLE TRIGGER [dbo].[Departementst_update_trigger] ON [Departements];
DISABLE TRIGGER [dbo].[Departementst_insert_trigger] ON [Departements];
DISABLE TRIGGER [dbo].[Departementst_delete_trigger] ON [Departements];
DELETE FROM [Departements];
DELETE FROM [tDepartements];
ENABLE TRIGGER [dbo].[Departementst_update_trigger] ON [Departements];
ENABLE TRIGGER [dbo].[Departementst_insert_trigger] ON [Departements];
ENABLE TRIGGER [dbo].[Departementst_delete_trigger] ON [Departements];

SET @sync_row_count = @@ROWCOUNT;

END
GO
/****** Object:  StoredProcedure [dbo].[sDepartements_selectrow]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sDepartements_selectrow]
	@Id int,
	@sync_scope_id uniqueidentifier
AS
BEGIN
SELECT 
	[side].[Id], 
	[base].[Name], 
	[base].[OfficeId], 
	[side].[sync_row_is_tombstone] as [sync_row_is_tombstone], 
	[side].[update_scope_id] as [sync_update_scope_id]
FROM [Departements] [base]
RIGHT JOIN [tDepartements] [side] ON
[base].[Id] = [side].[Id]
WHERE [side].[Id] = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[sDepartements_update]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sDepartements_update]
	@Id int,
	@Name nvarchar (50) = NULL,
	@OfficeId int = NULL,
	@sync_min_timestamp bigint,
	@sync_scope_id uniqueidentifier,
	@sync_force_write int,
	@sync_row_count int OUTPUT
AS
BEGIN
-- use a temp table to store the list of PKs that successfully got updated/inserted
declare @dms_changed TABLE ([Id] int,  PRIMARY KEY ( [Id]));


SET IDENTITY_INSERT [Departements] ON;

;WITH [changes] AS (
	SELECT [p].[Id], [p].[Name], [p].[OfficeId], 
	[side].[update_scope_id] as [sync_update_scope_id], [side].[timestamp] as [sync_timestamp], [side].[sync_row_is_tombstone] as [sync_row_is_tombstone]
	FROM (SELECT 
		 @Id as [Id], @Name as [Name], @OfficeId as [OfficeId]) AS [p]
	LEFT JOIN [tDepartements] [side] ON 	[p].[Id] = [side].[Id]
	)
MERGE [Departements] AS [base]
USING [changes] on [changes].[Id] = [base].[Id]
WHEN MATCHED AND ([changes].[sync_timestamp] <= @sync_min_timestamp OR [changes].[sync_timestamp] IS NULL OR [changes].[sync_update_scope_id] = @sync_scope_id OR @sync_force_write = 1) THEN

	UPDATE SET
	[Name] = [changes].[Name]
	, [OfficeId] = [changes].[OfficeId]
WHEN NOT MATCHED BY TARGET AND ([changes].[sync_timestamp] <= @sync_min_timestamp OR [changes].[sync_timestamp] IS NULL OR @sync_force_write = 1) THEN

	INSERT
	([Id], [Name], [OfficeId])
	VALUES ([changes].[Id], [changes].[Name], [changes].[OfficeId])

OUTPUT  INSERTED.[Id]
INTO @dms_changed; -- populates the temp table with successful PKs


SET IDENTITY_INSERT [Departements] ON;

SET @sync_row_count = 0;

-- Since the update trigger is passed, we update the tracking table to reflect the real scope updater
UPDATE [side] SET
	[update_scope_id] = @sync_scope_id,
	[sync_row_is_tombstone] = 0,
	[last_change_datetime] = GETUTCDATE()
FROM [tDepartements] [side]
JOIN @dms_changed [t] on [t].[Id] = [side].[Id]

SET @sync_row_count = @@ROWCOUNT;

END
GO
/****** Object:  StoredProcedure [dbo].[sEmployee_bulkdelete]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sEmployee_bulkdelete]
	@sync_min_timestamp bigint,
	@sync_scope_id uniqueidentifier,
	@changeTable [dbo].[sEmployee_BulkType] READONLY
AS
BEGIN
-- use a temp table to store the list of PKs that successfully got deleted
declare @dms_changed TABLE ([Id] int,  PRIMARY KEY ([Id]));

;WITH [changes] AS (
	SELECT [p].[Id], [p].[FirstName], [p].[LastName], [p].[DateOfBirth], [p].[Address], [p].[PhoneNumber], 
	[side].[update_scope_id] as [sync_update_scope_id], [side].[timestamp] as [sync_timestamp], [side].[sync_row_is_tombstone] as [sync_row_is_tombstone]
	FROM @changeTable [p]
	LEFT JOIN [tEmployee] [side] ON 	[p].[Id] = [side].[Id]
	)
DELETE [Employee]
OUTPUT DELETED.[Id]
INTO @dms_changed 
FROM [Employee] [base]
JOIN [changes] ON [changes].[Id] = [base].[Id]
WHERE [changes].[sync_timestamp] <= @sync_min_timestamp OR [changes].[sync_timestamp] IS NULL OR [changes].[sync_update_scope_id] = @sync_scope_id;

-- Since the delete trigger is passed, we update the tracking table to reflect the real scope deleter
UPDATE [side] SET
	sync_row_is_tombstone = 1, 
	update_scope_id = @sync_scope_id,
	last_change_datetime = GETUTCDATE()
FROM [tEmployee] [side]
JOIN @dms_changed [t] on [t].[Id] = [side].[Id]


--Select all ids not inserted / deleted / updated as conflict
SELECT  [t].[Id] ,[t].[FirstName] ,[t].[LastName] ,[t].[DateOfBirth] ,[t].[Address] ,[t].[PhoneNumber]
FROM @changeTable [t]
WHERE NOT EXISTS (
	 SELECT  [Id]	 FROM @dms_changed [i]
	 WHERE  [t].[Id] = [i].[Id]	)

END
GO
/****** Object:  StoredProcedure [dbo].[sEmployee_bulkupdate]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sEmployee_bulkupdate]
	@sync_min_timestamp bigint,
	@sync_scope_id uniqueidentifier,
	@changeTable [dbo].[sEmployee_BulkType] READONLY
AS
BEGIN
-- use a temp table to store the list of PKs that successfully got updated/inserted
declare @dms_changed TABLE ([Id] int,  PRIMARY KEY ( [Id]));


SET IDENTITY_INSERT [Employee] ON;

;WITH [changes] AS (
	SELECT [p].[Id], [p].[FirstName], [p].[LastName], [p].[DateOfBirth], [p].[Address], [p].[PhoneNumber], 
	[side].[update_scope_id] as [sync_update_scope_id], [side].[timestamp] as [sync_timestamp], [side].[sync_row_is_tombstone] as [sync_row_is_tombstone]
	FROM @changeTable [p]
	LEFT JOIN [tEmployee] [side] ON 
	[p].[Id] = [side].[Id]	)
MERGE [Employee] AS [base]
USING [changes] on [changes].[Id] = [base].[Id]
WHEN MATCHED AND ([changes].[sync_timestamp] <= @sync_min_timestamp OR [changes].[sync_timestamp] IS NULL OR [changes].[sync_update_scope_id] = @sync_scope_id) THEN

	UPDATE SET
	[FirstName] = [changes].[FirstName]
	, [LastName] = [changes].[LastName]
	, [DateOfBirth] = [changes].[DateOfBirth]
	, [Address] = [changes].[Address]
	, [PhoneNumber] = [changes].[PhoneNumber]
WHEN NOT MATCHED BY TARGET AND ([changes].[sync_timestamp] <= @sync_min_timestamp OR [changes].[sync_timestamp] IS NULL) THEN

	INSERT
	([Id], [FirstName], [LastName], [DateOfBirth], [Address], [PhoneNumber])
	VALUES ([changes].[Id], [changes].[FirstName], [changes].[LastName], [changes].[DateOfBirth], [changes].[Address], [changes].[PhoneNumber])
	OUTPUT  INSERTED.[Id]
	INTO @dms_changed; -- populates the temp table with successful PKs


SET IDENTITY_INSERT [Employee] ON;

-- Since the update trigger is passed, we update the tracking table to reflect the real scope updater
UPDATE [side] SET
	[update_scope_id] = @sync_scope_id,
	[sync_row_is_tombstone] = 0,
	[last_change_datetime] = GETUTCDATE()
FROM [tEmployee] [side]
JOIN @dms_changed [t] on [t].[Id] = [side].[Id]

--Select all ids not inserted / deleted / updated as conflict
SELECT  [t].[Id] ,[t].[FirstName] ,[t].[LastName] ,[t].[DateOfBirth] ,[t].[Address] ,[t].[PhoneNumber]
FROM @changeTable [t]
WHERE NOT EXISTS (
	 SELECT  [Id]	 FROM @dms_changed [i]
	 WHERE  [t].[Id] = [i].[Id]	)

END
GO
/****** Object:  StoredProcedure [dbo].[sEmployee_changes]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sEmployee_changes]
	@sync_min_timestamp bigint = 0,
	@sync_scope_id uniqueidentifier = NULL
AS
BEGIN
SELECT DISTINCT	[side].[Id], 
	[base].[FirstName], 
	[base].[LastName], 
	[base].[DateOfBirth], 
	[base].[Address], 
	[base].[PhoneNumber], 
	[side].[sync_row_is_tombstone] as [sync_row_is_tombstone], 
	[side].[update_scope_id] as [sync_update_scope_id]
FROM [Employee] [base]
RIGHT JOIN [tEmployee] [side] ON [base].[Id] = [side].[Id]
WHERE (
	[side].[timestamp] > @sync_min_timestamp
	AND ([side].[update_scope_id] <> @sync_scope_id OR [side].[update_scope_id] IS NULL)
)

END
GO
/****** Object:  StoredProcedure [dbo].[sEmployee_delete]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sEmployee_delete]
	@Id int,
	@sync_scope_id uniqueidentifier,
	@sync_force_write int,
	@sync_min_timestamp bigint,
	@sync_row_count int OUTPUT
AS
BEGIN
-- use a temp table to store the list of PKs that successfully got updated/inserted
declare @dms_changed TABLE ([Id] int,  PRIMARY KEY ( [Id]));

DELETE [Employee]
OUTPUT DELETED.[Id] INTO @dms_changed -- populates the temp table with successful deleted row
FROM [Employee] [base]
LEFT JOIN [tEmployee] [side] ON [base].[Id] = [side].[Id]
WHERE ([side].[timestamp] <= @sync_min_timestamp OR [side].[timestamp] IS NULL OR [side].[update_scope_id] = @sync_scope_id OR @sync_force_write = 1)
AND ([base].[Id] = @Id);

SET @sync_row_count = 0;
-- Since the update trigger is passed, we update the tracking table to reflect the real scope updater
UPDATE [side] SET
	[update_scope_id] = @sync_scope_id,
	[sync_row_is_tombstone] = 1,
	[last_change_datetime] = GETUTCDATE()
FROM [tEmployee] [side]
JOIN @dms_changed [t] on [t].[Id] = [side].[Id]

SET @sync_row_count = @@ROWCOUNT;

END
GO
/****** Object:  StoredProcedure [dbo].[sEmployee_deletemetadata]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sEmployee_deletemetadata]
	@Id int,
	@sync_row_timestamp bigint,
	@sync_row_count int OUTPUT
AS
BEGIN
SET @sync_row_count = 0;

DELETE [side] FROM [tEmployee] [side]
WHERE [side].[timestamp] < @sync_row_timestamp

SET @sync_row_count = @@ROWCOUNT;

END
GO
/****** Object:  StoredProcedure [dbo].[sEmployee_initialize]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sEmployee_initialize]
	@sync_min_timestamp bigint = NULL
AS
BEGIN
SELECT
	[base].[Id], 
	[base].[FirstName], 
	[base].[LastName], 
	[base].[DateOfBirth], 
	[base].[Address], 
	[base].[PhoneNumber]
FROM [Employee] [base]
LEFT JOIN [tEmployee] [side] ON [base].[Id] = [side].[Id]
WHERE (
	([side].[timestamp] > @sync_min_timestamp OR  @sync_min_timestamp IS NULL)
)

END
GO
/****** Object:  StoredProcedure [dbo].[sEmployee_OfficeId_changes]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sEmployee_OfficeId_changes]
	@sync_min_timestamp bigint = 0,
	@sync_scope_id uniqueidentifier = NULL,
	@OfficeId int
AS
BEGIN
SELECT DISTINCT	[side].[Id], 
	[base].[FirstName], 
	[base].[LastName], 
	[base].[DateOfBirth], 
	[base].[Address], 
	[base].[PhoneNumber], 
	[side].[sync_row_is_tombstone] as [sync_row_is_tombstone], 
	[side].[update_scope_id] as [sync_update_scope_id]
FROM [Employee] [base]
RIGHT JOIN [tEmployee] [side] ON [base].[Id] = [side].[Id]
INNER JOIN [EmployeeDetails] ON [EmployeeDetails].[EmployeeId] = [base].[Id]
INNER JOIN [Departements] ON [Departements].[Id] = [EmployeeDetails].[DepartmentId]

WHERE (
(
 (
   ([Departements].[OfficeId] = @OfficeId)
  )
 OR [side].[sync_row_is_tombstone] = 1
)
AND 
	[side].[timestamp] > @sync_min_timestamp
	AND ([side].[update_scope_id] <> @sync_scope_id OR [side].[update_scope_id] IS NULL)
)

END
GO
/****** Object:  StoredProcedure [dbo].[sEmployee_OfficeId_initialize]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sEmployee_OfficeId_initialize]
	@sync_min_timestamp bigint = NULL,
	@OfficeId int
AS
BEGIN
SELECT DISTINCT
	[base].[Id], 
	[base].[FirstName], 
	[base].[LastName], 
	[base].[DateOfBirth], 
	[base].[Address], 
	[base].[PhoneNumber]
FROM [Employee] [base]
LEFT JOIN [tEmployee] [side] ON [base].[Id] = [side].[Id]
INNER JOIN [EmployeeDetails] ON [EmployeeDetails].[EmployeeId] = [base].[Id]
INNER JOIN [Departements] ON [Departements].[Id] = [EmployeeDetails].[DepartmentId]

WHERE (
 (
   ([Departements].[OfficeId] = @OfficeId)
  )
AND 
	([side].[timestamp] > @sync_min_timestamp OR  @sync_min_timestamp IS NULL)
)

END
GO
/****** Object:  StoredProcedure [dbo].[sEmployee_reset]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sEmployee_reset]
	@sync_row_count int OUTPUT
AS
BEGIN
SET @sync_row_count = 0;

DISABLE TRIGGER [dbo].[Employeet_update_trigger] ON [Employee];
DISABLE TRIGGER [dbo].[Employeet_insert_trigger] ON [Employee];
DISABLE TRIGGER [dbo].[Employeet_delete_trigger] ON [Employee];
DELETE FROM [Employee];
DELETE FROM [tEmployee];
ENABLE TRIGGER [dbo].[Employeet_update_trigger] ON [Employee];
ENABLE TRIGGER [dbo].[Employeet_insert_trigger] ON [Employee];
ENABLE TRIGGER [dbo].[Employeet_delete_trigger] ON [Employee];

SET @sync_row_count = @@ROWCOUNT;

END
GO
/****** Object:  StoredProcedure [dbo].[sEmployee_selectrow]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sEmployee_selectrow]
	@Id int,
	@sync_scope_id uniqueidentifier
AS
BEGIN
SELECT 
	[side].[Id], 
	[base].[FirstName], 
	[base].[LastName], 
	[base].[DateOfBirth], 
	[base].[Address], 
	[base].[PhoneNumber], 
	[side].[sync_row_is_tombstone] as [sync_row_is_tombstone], 
	[side].[update_scope_id] as [sync_update_scope_id]
FROM [Employee] [base]
RIGHT JOIN [tEmployee] [side] ON
[base].[Id] = [side].[Id]
WHERE [side].[Id] = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[sEmployee_update]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sEmployee_update]
	@Id int,
	@FirstName nvarchar (50) = NULL,
	@LastName nvarchar (50) = NULL,
	@DateOfBirth date = NULL,
	@Address nvarchar (4000) = NULL,
	@PhoneNumber varchar (50) = NULL,
	@sync_min_timestamp bigint,
	@sync_scope_id uniqueidentifier,
	@sync_force_write int,
	@sync_row_count int OUTPUT
AS
BEGIN
-- use a temp table to store the list of PKs that successfully got updated/inserted
declare @dms_changed TABLE ([Id] int,  PRIMARY KEY ( [Id]));


SET IDENTITY_INSERT [Employee] ON;

;WITH [changes] AS (
	SELECT [p].[Id], [p].[FirstName], [p].[LastName], [p].[DateOfBirth], [p].[Address], [p].[PhoneNumber], 
	[side].[update_scope_id] as [sync_update_scope_id], [side].[timestamp] as [sync_timestamp], [side].[sync_row_is_tombstone] as [sync_row_is_tombstone]
	FROM (SELECT 
		 @Id as [Id], @FirstName as [FirstName], @LastName as [LastName], @DateOfBirth as [DateOfBirth], @Address as [Address], @PhoneNumber as [PhoneNumber]) AS [p]
	LEFT JOIN [tEmployee] [side] ON 	[p].[Id] = [side].[Id]
	)
MERGE [Employee] AS [base]
USING [changes] on [changes].[Id] = [base].[Id]
WHEN MATCHED AND ([changes].[sync_timestamp] <= @sync_min_timestamp OR [changes].[sync_timestamp] IS NULL OR [changes].[sync_update_scope_id] = @sync_scope_id OR @sync_force_write = 1) THEN

	UPDATE SET
	[FirstName] = [changes].[FirstName]
	, [LastName] = [changes].[LastName]
	, [DateOfBirth] = [changes].[DateOfBirth]
	, [Address] = [changes].[Address]
	, [PhoneNumber] = [changes].[PhoneNumber]
WHEN NOT MATCHED BY TARGET AND ([changes].[sync_timestamp] <= @sync_min_timestamp OR [changes].[sync_timestamp] IS NULL OR @sync_force_write = 1) THEN

	INSERT
	([Id], [FirstName], [LastName], [DateOfBirth], [Address], [PhoneNumber])
	VALUES ([changes].[Id], [changes].[FirstName], [changes].[LastName], [changes].[DateOfBirth], [changes].[Address], [changes].[PhoneNumber])

OUTPUT  INSERTED.[Id]
INTO @dms_changed; -- populates the temp table with successful PKs


SET IDENTITY_INSERT [Employee] ON;

SET @sync_row_count = 0;

-- Since the update trigger is passed, we update the tracking table to reflect the real scope updater
UPDATE [side] SET
	[update_scope_id] = @sync_scope_id,
	[sync_row_is_tombstone] = 0,
	[last_change_datetime] = GETUTCDATE()
FROM [tEmployee] [side]
JOIN @dms_changed [t] on [t].[Id] = [side].[Id]

SET @sync_row_count = @@ROWCOUNT;

END
GO
/****** Object:  StoredProcedure [dbo].[sEmployeeDetails_bulkdelete]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sEmployeeDetails_bulkdelete]
	@sync_min_timestamp bigint,
	@sync_scope_id uniqueidentifier,
	@changeTable [dbo].[sEmployeeDetails_BulkType] READONLY
AS
BEGIN
-- use a temp table to store the list of PKs that successfully got deleted
declare @dms_changed TABLE ([Id] int,  PRIMARY KEY ([Id]));

;WITH [changes] AS (
	SELECT [p].[Id], [p].[BasicSalary], [p].[Location], [p].[DepartmentId], [p].[EmployeeId], 
	[side].[update_scope_id] as [sync_update_scope_id], [side].[timestamp] as [sync_timestamp], [side].[sync_row_is_tombstone] as [sync_row_is_tombstone]
	FROM @changeTable [p]
	LEFT JOIN [tEmployeeDetails] [side] ON 	[p].[Id] = [side].[Id]
	)
DELETE [EmployeeDetails]
OUTPUT DELETED.[Id]
INTO @dms_changed 
FROM [EmployeeDetails] [base]
JOIN [changes] ON [changes].[Id] = [base].[Id]
WHERE [changes].[sync_timestamp] <= @sync_min_timestamp OR [changes].[sync_timestamp] IS NULL OR [changes].[sync_update_scope_id] = @sync_scope_id;

-- Since the delete trigger is passed, we update the tracking table to reflect the real scope deleter
UPDATE [side] SET
	sync_row_is_tombstone = 1, 
	update_scope_id = @sync_scope_id,
	last_change_datetime = GETUTCDATE()
FROM [tEmployeeDetails] [side]
JOIN @dms_changed [t] on [t].[Id] = [side].[Id]


--Select all ids not inserted / deleted / updated as conflict
SELECT  [t].[Id] ,[t].[BasicSalary] ,[t].[Location] ,[t].[DepartmentId] ,[t].[EmployeeId]
FROM @changeTable [t]
WHERE NOT EXISTS (
	 SELECT  [Id]	 FROM @dms_changed [i]
	 WHERE  [t].[Id] = [i].[Id]	)

END
GO
/****** Object:  StoredProcedure [dbo].[sEmployeeDetails_bulkupdate]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sEmployeeDetails_bulkupdate]
	@sync_min_timestamp bigint,
	@sync_scope_id uniqueidentifier,
	@changeTable [dbo].[sEmployeeDetails_BulkType] READONLY
AS
BEGIN
-- use a temp table to store the list of PKs that successfully got updated/inserted
declare @dms_changed TABLE ([Id] int,  PRIMARY KEY ( [Id]));


SET IDENTITY_INSERT [EmployeeDetails] ON;

;WITH [changes] AS (
	SELECT [p].[Id], [p].[BasicSalary], [p].[Location], [p].[DepartmentId], [p].[EmployeeId], 
	[side].[update_scope_id] as [sync_update_scope_id], [side].[timestamp] as [sync_timestamp], [side].[sync_row_is_tombstone] as [sync_row_is_tombstone]
	FROM @changeTable [p]
	LEFT JOIN [tEmployeeDetails] [side] ON 
	[p].[Id] = [side].[Id]	)
MERGE [EmployeeDetails] AS [base]
USING [changes] on [changes].[Id] = [base].[Id]
WHEN MATCHED AND ([changes].[sync_timestamp] <= @sync_min_timestamp OR [changes].[sync_timestamp] IS NULL OR [changes].[sync_update_scope_id] = @sync_scope_id) THEN

	UPDATE SET
	[BasicSalary] = [changes].[BasicSalary]
	, [Location] = [changes].[Location]
	, [DepartmentId] = [changes].[DepartmentId]
	, [EmployeeId] = [changes].[EmployeeId]
WHEN NOT MATCHED BY TARGET AND ([changes].[sync_timestamp] <= @sync_min_timestamp OR [changes].[sync_timestamp] IS NULL) THEN

	INSERT
	([Id], [BasicSalary], [Location], [DepartmentId], [EmployeeId])
	VALUES ([changes].[Id], [changes].[BasicSalary], [changes].[Location], [changes].[DepartmentId], [changes].[EmployeeId])
	OUTPUT  INSERTED.[Id]
	INTO @dms_changed; -- populates the temp table with successful PKs


SET IDENTITY_INSERT [EmployeeDetails] ON;

-- Since the update trigger is passed, we update the tracking table to reflect the real scope updater
UPDATE [side] SET
	[update_scope_id] = @sync_scope_id,
	[sync_row_is_tombstone] = 0,
	[last_change_datetime] = GETUTCDATE()
FROM [tEmployeeDetails] [side]
JOIN @dms_changed [t] on [t].[Id] = [side].[Id]

--Select all ids not inserted / deleted / updated as conflict
SELECT  [t].[Id] ,[t].[BasicSalary] ,[t].[Location] ,[t].[DepartmentId] ,[t].[EmployeeId]
FROM @changeTable [t]
WHERE NOT EXISTS (
	 SELECT  [Id]	 FROM @dms_changed [i]
	 WHERE  [t].[Id] = [i].[Id]	)

END
GO
/****** Object:  StoredProcedure [dbo].[sEmployeeDetails_changes]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sEmployeeDetails_changes]
	@sync_min_timestamp bigint = 0,
	@sync_scope_id uniqueidentifier = NULL
AS
BEGIN
SELECT DISTINCT	[side].[Id], 
	[base].[BasicSalary], 
	[base].[Location], 
	[base].[DepartmentId], 
	[base].[EmployeeId], 
	[side].[sync_row_is_tombstone] as [sync_row_is_tombstone], 
	[side].[update_scope_id] as [sync_update_scope_id]
FROM [EmployeeDetails] [base]
RIGHT JOIN [tEmployeeDetails] [side] ON [base].[Id] = [side].[Id]
WHERE (
	[side].[timestamp] > @sync_min_timestamp
	AND ([side].[update_scope_id] <> @sync_scope_id OR [side].[update_scope_id] IS NULL)
)

END
GO
/****** Object:  StoredProcedure [dbo].[sEmployeeDetails_delete]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sEmployeeDetails_delete]
	@Id int,
	@sync_scope_id uniqueidentifier,
	@sync_force_write int,
	@sync_min_timestamp bigint,
	@sync_row_count int OUTPUT
AS
BEGIN
-- use a temp table to store the list of PKs that successfully got updated/inserted
declare @dms_changed TABLE ([Id] int,  PRIMARY KEY ( [Id]));

DELETE [EmployeeDetails]
OUTPUT DELETED.[Id] INTO @dms_changed -- populates the temp table with successful deleted row
FROM [EmployeeDetails] [base]
LEFT JOIN [tEmployeeDetails] [side] ON [base].[Id] = [side].[Id]
WHERE ([side].[timestamp] <= @sync_min_timestamp OR [side].[timestamp] IS NULL OR [side].[update_scope_id] = @sync_scope_id OR @sync_force_write = 1)
AND ([base].[Id] = @Id);

SET @sync_row_count = 0;
-- Since the update trigger is passed, we update the tracking table to reflect the real scope updater
UPDATE [side] SET
	[update_scope_id] = @sync_scope_id,
	[sync_row_is_tombstone] = 1,
	[last_change_datetime] = GETUTCDATE()
FROM [tEmployeeDetails] [side]
JOIN @dms_changed [t] on [t].[Id] = [side].[Id]

SET @sync_row_count = @@ROWCOUNT;

END
GO
/****** Object:  StoredProcedure [dbo].[sEmployeeDetails_deletemetadata]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sEmployeeDetails_deletemetadata]
	@Id int,
	@sync_row_timestamp bigint,
	@sync_row_count int OUTPUT
AS
BEGIN
SET @sync_row_count = 0;

DELETE [side] FROM [tEmployeeDetails] [side]
WHERE [side].[timestamp] < @sync_row_timestamp

SET @sync_row_count = @@ROWCOUNT;

END
GO
/****** Object:  StoredProcedure [dbo].[sEmployeeDetails_initialize]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sEmployeeDetails_initialize]
	@sync_min_timestamp bigint = NULL
AS
BEGIN
SELECT
	[base].[Id], 
	[base].[BasicSalary], 
	[base].[Location], 
	[base].[DepartmentId], 
	[base].[EmployeeId]
FROM [EmployeeDetails] [base]
LEFT JOIN [tEmployeeDetails] [side] ON [base].[Id] = [side].[Id]
WHERE (
	([side].[timestamp] > @sync_min_timestamp OR  @sync_min_timestamp IS NULL)
)

END
GO
/****** Object:  StoredProcedure [dbo].[sEmployeeDetails_reset]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sEmployeeDetails_reset]
	@sync_row_count int OUTPUT
AS
BEGIN
SET @sync_row_count = 0;

DISABLE TRIGGER [dbo].[EmployeeDetailst_update_trigger] ON [EmployeeDetails];
DISABLE TRIGGER [dbo].[EmployeeDetailst_insert_trigger] ON [EmployeeDetails];
DISABLE TRIGGER [dbo].[EmployeeDetailst_delete_trigger] ON [EmployeeDetails];
DELETE FROM [EmployeeDetails];
DELETE FROM [tEmployeeDetails];
ENABLE TRIGGER [dbo].[EmployeeDetailst_update_trigger] ON [EmployeeDetails];
ENABLE TRIGGER [dbo].[EmployeeDetailst_insert_trigger] ON [EmployeeDetails];
ENABLE TRIGGER [dbo].[EmployeeDetailst_delete_trigger] ON [EmployeeDetails];

SET @sync_row_count = @@ROWCOUNT;

END
GO
/****** Object:  StoredProcedure [dbo].[sEmployeeDetails_selectrow]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sEmployeeDetails_selectrow]
	@Id int,
	@sync_scope_id uniqueidentifier
AS
BEGIN
SELECT 
	[side].[Id], 
	[base].[BasicSalary], 
	[base].[Location], 
	[base].[DepartmentId], 
	[base].[EmployeeId], 
	[side].[sync_row_is_tombstone] as [sync_row_is_tombstone], 
	[side].[update_scope_id] as [sync_update_scope_id]
FROM [EmployeeDetails] [base]
RIGHT JOIN [tEmployeeDetails] [side] ON
[base].[Id] = [side].[Id]
WHERE [side].[Id] = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[sEmployeeDetails_update]    Script Date: 11/14/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sEmployeeDetails_update]
	@Id int,
	@BasicSalary decimal (18) = NULL,
	@Location nvarchar (50) = NULL,
	@DepartmentId int = NULL,
	@EmployeeId int = NULL,
	@sync_min_timestamp bigint,
	@sync_scope_id uniqueidentifier,
	@sync_force_write int,
	@sync_row_count int OUTPUT
AS
BEGIN
-- use a temp table to store the list of PKs that successfully got updated/inserted
declare @dms_changed TABLE ([Id] int,  PRIMARY KEY ( [Id]));


SET IDENTITY_INSERT [EmployeeDetails] ON;

;WITH [changes] AS (
	SELECT [p].[Id], [p].[BasicSalary], [p].[Location], [p].[DepartmentId], [p].[EmployeeId], 
	[side].[update_scope_id] as [sync_update_scope_id], [side].[timestamp] as [sync_timestamp], [side].[sync_row_is_tombstone] as [sync_row_is_tombstone]
	FROM (SELECT 
		 @Id as [Id], @BasicSalary as [BasicSalary], @Location as [Location], @DepartmentId as [DepartmentId], @EmployeeId as [EmployeeId]) AS [p]
	LEFT JOIN [tEmployeeDetails] [side] ON 	[p].[Id] = [side].[Id]
	)
MERGE [EmployeeDetails] AS [base]
USING [changes] on [changes].[Id] = [base].[Id]
WHEN MATCHED AND ([changes].[sync_timestamp] <= @sync_min_timestamp OR [changes].[sync_timestamp] IS NULL OR [changes].[sync_update_scope_id] = @sync_scope_id OR @sync_force_write = 1) THEN

	UPDATE SET
	[BasicSalary] = [changes].[BasicSalary]
	, [Location] = [changes].[Location]
	, [DepartmentId] = [changes].[DepartmentId]
	, [EmployeeId] = [changes].[EmployeeId]
WHEN NOT MATCHED BY TARGET AND ([changes].[sync_timestamp] <= @sync_min_timestamp OR [changes].[sync_timestamp] IS NULL OR @sync_force_write = 1) THEN

	INSERT
	([Id], [BasicSalary], [Location], [DepartmentId], [EmployeeId])
	VALUES ([changes].[Id], [changes].[BasicSalary], [changes].[Location], [changes].[DepartmentId], [changes].[EmployeeId])

OUTPUT  INSERTED.[Id]
INTO @dms_changed; -- populates the temp table with successful PKs


SET IDENTITY_INSERT [EmployeeDetails] ON;

SET @sync_row_count = 0;

-- Since the update trigger is passed, we update the tracking table to reflect the real scope updater
UPDATE [side] SET
	[update_scope_id] = @sync_scope_id,
	[sync_row_is_tombstone] = 0,
	[last_change_datetime] = GETUTCDATE()
FROM [tEmployeeDetails] [side]
JOIN @dms_changed [t] on [t].[Id] = [side].[Id]

SET @sync_row_count = @@ROWCOUNT;

END
GO
