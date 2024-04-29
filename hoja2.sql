USE [IUSA]
GO

/****** Object:  Table [dbo].[Areas]    Script Date: 28/04/2024 07:16:18 p. m. ******/
DROP TABLE [dbo].[Areas]
GO

/****** Object:  Table [dbo].[Areas]    Script Date: 28/04/2024 07:16:18 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Areas](
	[id] [int] NULL,
	[area] [nvarchar](50) NULL,
	[Caso] [numeric](18, 0) NULL,
	[Reg] [numeric](18, 0) NULL,
	[Por] [nchar](10) NULL,
	[Total] [nchar](10) NULL
) ON [PRIMARY]

GO


CREATE TABLE [dbo].[Areas1](
	[id] [int] NULL,
	[area] [nvarchar](50) NULL,
	[Caso] [numeric](18, 0) NULL,
	[Reg] [numeric](18, 0) NULL,
	[Por] [nchar](10) NULL,
	[Total] [nchar](10) NULL
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[Areas2](
	[id] [int] NULL,
	[area] [nvarchar](50) NULL,
	[Caso] [numeric](18, 0) NULL,
	[Reg] [numeric](18, 0) NULL,
	[Por] [nchar](10) NULL,
	[Total] [nchar](10) NULL
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[Areas3](
	[id] [int] NULL,
	[area] [nvarchar](50) NULL,
	[Caso] [numeric](18, 0) NULL,
	[Reg] [numeric](18, 0) NULL,
	[Por] [nchar](10) NULL,
	[Total] [nchar](10) NULL
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[Areas4](
	[id] [int] NULL,
	[area] [nvarchar](50) NULL,
	[Caso] [numeric](18, 0) NULL,
	[Reg] [numeric](18, 0) NULL,
	[Por] [nchar](10) NULL,
	[Total] [nchar](10) NULL
) ON [PRIMARY]

GO


/****** Object:  Table [dbo].[Table2]    Script Date: 28/04/2024 07:18:20 p. m. ******/
DROP TABLE [dbo].[Table2]
GO

/****** Object:  Table [dbo].[Table2]    Script Date: 28/04/2024 07:18:20 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Table2](
	[Id] [int] NOT NULL,
	[Month] [nvarchar](50) NULL,
	[Quantity] [float] NULL,
	[Img] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

