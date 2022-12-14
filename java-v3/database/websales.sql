USE [websales]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/1/2022 9:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[NameVN] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 11/1/2022 9:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[Activated] [bit] NOT NULL,
	[Admin] [bit] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 11/1/2022 9:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/1/2022 9:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [nvarchar](20) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Address] [nvarchar](60) NOT NULL,
	[Amount] [float] NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/1/2022 9:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](60) NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ProductDate] [date] NOT NULL,
	[Available] [bit] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ViewCount] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (1000, N'Watches', N'Đồng hồ đeo tay')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (1001, N'Laptops', N'Máy tính xách tay')
INSERT [dbo].[Categories] ([Id], [Name], [NameVN]) VALUES (1002, N'Cameras', N'Máy ảnh')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
INSERT [dbo].[Customers] ([Id], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'admin', N'123456', N'admin', N'az@gmail.com', N'zcv.jpg', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (21, 19, 1047, 9.5, 1, 0)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [CustomerId], [OrderDate], [Address], [Amount], [Description], [Status]) VALUES (19, N'admin', CAST(N'2022-11-01T00:00:00.000' AS DateTime), N'ha noi', 9.5, N'abc', 2)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1039, N'Chartreuse verte', N'1039.jpg', 18, 0, 18, CAST(N'2022-11-01' AS Date), 1, 1000, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1043, N'Ipoh Coffee', N'1043.jpg', 46, 0, 46, CAST(N'2022-10-27' AS Date), 1, 1000, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 1)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1044, N'Gula Malacca', N'1044.jpg', 19.45, 0, 19, CAST(N'2022-10-27' AS Date), 1, 1001, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1047, N'Zaanse koeken', N'1047.jpg', 9.5, 0, 9, CAST(N'2022-10-28' AS Date), 1, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 1)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1048, N'Chocolade', N'1048.jpg', 12.75, 0, 12, CAST(N'2022-10-28' AS Date), 0, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1049, N'Maxilaku', N'1049.jpg', 20, 0, 20, CAST(N'2022-10-27' AS Date), 0, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1050, N'Valkoinen suklaa', N'1050.jpg', 16.25, 0, 16, CAST(N'2022-10-28' AS Date), 0, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1059, N'Raclette Courdavault', N'fujifilm-instax-mini-70-vang.jpg', 55, 0, 55, CAST(N'2022-10-28' AS Date), 1, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1060, N'Camembert Pierrot', N'fujifilm-xt30-mark-ii-kit-xc-1545mm.jpg', 34, 0, 34, CAST(N'2022-10-28' AS Date), 1, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1061, N'Sirop d''aOrable', N'1061.jpg', 28.5, 0, 28, CAST(N'2022-10-27' AS Date), 0, 1001, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1062, N'Tarte au sucre', N'1062.jpg', 49.3, 0, 49, CAST(N'2022-10-27' AS Date), 1, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1063, N'Vegie-spread', N'1063.jpg', 43.9, 0, 43, CAST(N'2022-10-28' AS Date), 1, 1001, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1065, N'Louisiana Fiery Hot Pepper Sauce', N'1065.jpg', 21.05, 0, 21, CAST(N'2022-10-27' AS Date), 1, 1001, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1066, N'Louisiana Hot Spiced Okra', N'1066.jpg', 17, 0, 17, CAST(N'2022-10-27' AS Date), 1, 1001, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1067, N'Laughing Lumberjack Lager', N'1067.jpg', 14, 0, 14, CAST(N'2022-10-27' AS Date), 1, 1000, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1068, N'Scottish Longbreads', N'1068.jpg', 12.5, 0, 12, CAST(N'2022-10-27' AS Date), 0, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1069, N'Gudbrandsdalsost', N'1069.jpg', 36, 0, 36, CAST(N'2011-03-09' AS Date), 0, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 3)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1070, N'Outback Lager', N'1070.jpg', 15, 0, 15, CAST(N'2022-10-27' AS Date), 1, 1000, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1071, N'Flotemysost', N'1071.jpg', 21.5, 0, 21, CAST(N'1980-09-04' AS Date), 1, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1072, N'Mozzarella di Giovanni', N'1072.jpg', 34.8, 0, 34, CAST(N'2022-10-27' AS Date), 1, 1002, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1075, N'RhanbrAu Klosterbier', N'1075.jpg', 7.75, 0, 7, CAST(N'2022-10-28' AS Date), 1, 1000, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1076, N'Lakkalik AAri', N'1076.jpg', 18, 0, 18, CAST(N'2022-10-27' AS Date), 1, 1000, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [UnitPrice], [Discount], [Quantity], [ProductDate], [Available], [CategoryId], [Description], [ViewCount]) VALUES (1077, N'Acer nitro3-r5', N'2_64_37.jpg', 13, 0, 13, CAST(N'2022-10-27' AS Date), 1, 1001, N'EmEditor uses JavaScript or VBScript for its macro language, so those who are familiar with HTML or Windows scripting will be able to write macros with little difficulty. For those unfamiliar with scripting languages, EmEditor can record keystrokes, which can then be saved in a macro file that can easily be loaded in different situations. With the use of JavaScript or VBScript, you can also troubleshoot your code easily. For example, in JavaScript, you can use the following statement to troubleshoot errors', 0)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
/****** Object:  StoredProcedure [dbo].[SP_getAllProduct]    Script Date: 11/1/2022 9:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROC [dbo].[SP_getAllProduct]
as
begin
SELECT * FROM Products

end

GO
/****** Object:  StoredProcedure [dbo].[sp_insertCategory]    Script Date: 11/1/2022 9:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_insertCategory]
(
@Na nvarchar(50),
@NaVN nvarchar(50)
 
 ) as
begin
INSERT INTO Categories(Name,NameVN) values(@Na ,@NaVN)
end
GO
/****** Object:  StoredProcedure [dbo].[SP_SearchProducts]    Script Date: 11/1/2022 9:19:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROC [dbo].[SP_SearchProducts]( @MaxPrice Float = 0,
@MinPrice float = 0)
as
begin
SELECT * FROM Products where UnitPrice between @MinPrice and @MaxPrice 

end
GO
