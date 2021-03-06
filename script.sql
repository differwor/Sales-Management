USE [DBJavaFx]
GO
ALTER TABLE [dbo].[tblProduct] DROP CONSTRAINT [FK_tblProduct_tblCategory]
GO
ALTER TABLE [dbo].[tblInvoiceDetail] DROP CONSTRAINT [FK_tblInvoiceDetail_tblProduct]
GO
ALTER TABLE [dbo].[tblInvoiceDetail] DROP CONSTRAINT [FK_tblInvoiceDetail_tblInvoice]
GO
ALTER TABLE [dbo].[tblInvoice] DROP CONSTRAINT [FK_tblInvoice_tblMember]
GO
/****** Object:  Index [UQ__tblProdu__442C24E404F7F159]    Script Date: 6/18/2021 9:09:14 PM ******/
ALTER TABLE [dbo].[tblProduct] DROP CONSTRAINT [UQ__tblProdu__442C24E404F7F159]
GO
/****** Object:  Index [UQ__tblMembe__E18484D9ACA2D41D]    Script Date: 6/18/2021 9:09:14 PM ******/
ALTER TABLE [dbo].[tblMember] DROP CONSTRAINT [UQ__tblMembe__E18484D9ACA2D41D]
GO
/****** Object:  Index [UQ__tblMembe__6E52856AEE55AD0B]    Script Date: 6/18/2021 9:09:14 PM ******/
ALTER TABLE [dbo].[tblMember] DROP CONSTRAINT [UQ__tblMembe__6E52856AEE55AD0B]
GO
/****** Object:  Index [UQ__tblCateg__7AC69D3D095FC186]    Script Date: 6/18/2021 9:09:14 PM ******/
ALTER TABLE [dbo].[tblCategory] DROP CONSTRAINT [UQ__tblCateg__7AC69D3D095FC186]
GO
/****** Object:  Index [UQ__tblAccou__F3DBC572F9086074]    Script Date: 6/18/2021 9:09:14 PM ******/
ALTER TABLE [dbo].[tblAccount] DROP CONSTRAINT [UQ__tblAccou__F3DBC572F9086074]
GO
/****** Object:  Index [UQ__tblAccou__6E2DBEDED2119313]    Script Date: 6/18/2021 9:09:14 PM ******/
ALTER TABLE [dbo].[tblAccount] DROP CONSTRAINT [UQ__tblAccou__6E2DBEDED2119313]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 6/18/2021 9:09:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblProduct]') AND type in (N'U'))
DROP TABLE [dbo].[tblProduct]
GO
/****** Object:  Table [dbo].[tblMember]    Script Date: 6/18/2021 9:09:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblMember]') AND type in (N'U'))
DROP TABLE [dbo].[tblMember]
GO
/****** Object:  Table [dbo].[tblInvoiceDetail]    Script Date: 6/18/2021 9:09:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblInvoiceDetail]') AND type in (N'U'))
DROP TABLE [dbo].[tblInvoiceDetail]
GO
/****** Object:  Table [dbo].[tblInvoice]    Script Date: 6/18/2021 9:09:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblInvoice]') AND type in (N'U'))
DROP TABLE [dbo].[tblInvoice]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 6/18/2021 9:09:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblCategory]') AND type in (N'U'))
DROP TABLE [dbo].[tblCategory]
GO
/****** Object:  Table [dbo].[tblAccount]    Script Date: 6/18/2021 9:09:14 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblAccount]') AND type in (N'U'))
DROP TABLE [dbo].[tblAccount]
GO
/****** Object:  Table [dbo].[tblAccount]    Script Date: 6/18/2021 9:09:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccount](
	[id_acc] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](100) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[grantname] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tblAcount] PRIMARY KEY CLUSTERED 
(
	[id_acc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 6/18/2021 9:09:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[id_category] [int] IDENTITY(1,1) NOT NULL,
	[name_category] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[id_category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblInvoice]    Script Date: 6/18/2021 9:09:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInvoice](
	[id] [nvarchar](100) NOT NULL,
	[code_member] [varchar](100) NULL,
	[datecreated] [nvarchar](100) NOT NULL,
	[discount] [int] NOT NULL,
	[total] [int] NOT NULL,
 CONSTRAINT [PK_tblInvoice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblInvoiceDetail]    Script Date: 6/18/2021 9:09:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInvoiceDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_invoice] [nvarchar](100) NULL,
	[id_product] [int] NULL,
	[quantity] [int] NOT NULL,
	[price] [int] NOT NULL,
	[totalprice] [int] NOT NULL,
	[datepurchase] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tblInvoiceDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMember]    Script Date: 6/18/2021 9:09:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMember](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code_member] [varchar](100) NOT NULL,
	[name_member] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tblMember] PRIMARY KEY CLUSTERED 
(
	[code_member] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 6/18/2021 9:09:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[id_product] [int] IDENTITY(1,1) NOT NULL,
	[name_product] [nvarchar](100) NULL,
	[price] [int] NOT NULL,
	[id_category] [int] NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[id_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblAccount] ON 

INSERT [dbo].[tblAccount] ([id_acc], [username], [password], [grantname]) VALUES (1, N'phuc', N'phuc', N'ADMIN')
INSERT [dbo].[tblAccount] ([id_acc], [username], [password], [grantname]) VALUES (2, N'phuc1', N'phuc1', N'EMPLOYEE')
INSERT [dbo].[tblAccount] ([id_acc], [username], [password], [grantname]) VALUES (3, N'phuc2', N'phuc2', N'EMPLOYEE')
SET IDENTITY_INSERT [dbo].[tblAccount] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCategory] ON 

INSERT [dbo].[tblCategory] ([id_category], [name_category]) VALUES (6, N'Bánh Ngọt')
INSERT [dbo].[tblCategory] ([id_category], [name_category]) VALUES (1, N'Cà Phê')
INSERT [dbo].[tblCategory] ([id_category], [name_category]) VALUES (4, N'Socola')
INSERT [dbo].[tblCategory] ([id_category], [name_category]) VALUES (2, N'Thức Uống Đá Xay')
INSERT [dbo].[tblCategory] ([id_category], [name_category]) VALUES (7, N'Thức Uống Khác')
INSERT [dbo].[tblCategory] ([id_category], [name_category]) VALUES (5, N'Thức Uống Trái Cây')
INSERT [dbo].[tblCategory] ([id_category], [name_category]) VALUES (3, N'Trà Đặc Biệt')
SET IDENTITY_INSERT [dbo].[tblCategory] OFF
GO
INSERT [dbo].[tblInvoice] ([id], [code_member], [datecreated], [discount], [total]) VALUES (N'1624024546768', N'null', N'2021-06-18 20:55:46.768', 0, 148000)
GO
SET IDENTITY_INSERT [dbo].[tblInvoiceDetail] ON 

INSERT [dbo].[tblInvoiceDetail] ([id], [id_invoice], [id_product], [quantity], [price], [totalprice], [datepurchase]) VALUES (1, N'1624024546768', 1, 1, 29000, 29000, N'2021-06-18 20:55:46.768')
INSERT [dbo].[tblInvoiceDetail] ([id], [id_invoice], [id_product], [quantity], [price], [totalprice], [datepurchase]) VALUES (2, N'1624024546768', 3, 1, 29000, 29000, N'2021-06-18 20:55:46.768')
INSERT [dbo].[tblInvoiceDetail] ([id], [id_invoice], [id_product], [quantity], [price], [totalprice], [datepurchase]) VALUES (3, N'1624024546768', 6, 2, 45000, 90000, N'2021-06-18 20:55:46.768')
SET IDENTITY_INSERT [dbo].[tblInvoiceDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMember] ON 

INSERT [dbo].[tblMember] ([id], [code_member], [name_member]) VALUES (1, N'20001', N'Tô Duy A')
INSERT [dbo].[tblMember] ([id], [code_member], [name_member]) VALUES (10, N'200010', N'Tô Duy S')
INSERT [dbo].[tblMember] ([id], [code_member], [name_member]) VALUES (13, N'200011', N'Tô Duy N')
INSERT [dbo].[tblMember] ([id], [code_member], [name_member]) VALUES (11, N'200012', N'Tô Duy M')
INSERT [dbo].[tblMember] ([id], [code_member], [name_member]) VALUES (2, N'20002', N'Tô Duy B')
INSERT [dbo].[tblMember] ([id], [code_member], [name_member]) VALUES (3, N'20003', N'Tô Duy C')
INSERT [dbo].[tblMember] ([id], [code_member], [name_member]) VALUES (4, N'20004', N'Tô Duy D')
INSERT [dbo].[tblMember] ([id], [code_member], [name_member]) VALUES (5, N'20005', N'Tô Duy E')
INSERT [dbo].[tblMember] ([id], [code_member], [name_member]) VALUES (6, N'20006', N'Tô Duy F')
INSERT [dbo].[tblMember] ([id], [code_member], [name_member]) VALUES (7, N'20007', N'Tô Duy G')
INSERT [dbo].[tblMember] ([id], [code_member], [name_member]) VALUES (8, N'20008', N'Tô Duy H')
INSERT [dbo].[tblMember] ([id], [code_member], [name_member]) VALUES (9, N'20009', N'Tô Duy K')
INSERT [dbo].[tblMember] ([id], [code_member], [name_member]) VALUES (14, N'null', N'null')
SET IDENTITY_INSERT [dbo].[tblMember] OFF
GO
SET IDENTITY_INSERT [dbo].[tblProduct] ON 

INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (1, N'Cà Phê Sữa', 29000, 1)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (2, N'Cà Phê Đen', 29000, 1)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (3, N'Bạc Xỉu', 29000, 1)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (4, N'Espresso ', 35000, 1)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (5, N'Espresso Sữa', 35000, 1)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (6, N'Latte', 45000, 1)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (7, N'Cappuccino', 45000, 1)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (8, N'Americano', 39000, 1)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (10, N'Mocha', 49000, 1)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (11, N'Caramel Macchiato', 55000, 1)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (12, N'Hazelnut Đá Xay', 59000, 2)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (13, N'Caramel Đá Xay', 59000, 2)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (14, N'Mocha Đá Xay', 59000, 2)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (15, N'Matcha Đá Xay', 59000, 2)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (16, N'Cookies Đá Xay', 59000, 2)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (17, N'Socola Đá Xay', 59000, 2)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (18, N'Sinh Tố Việt Quất', 59000, 2)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (19, N'Sinh Tố Cam Xoài', 59000, 2)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (20, N'Sinh Tố Dâu Ổi', 59000, 2)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (21, N'Trà Đào Cam Sả', 42000, 3)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (22, N'Trà Đen Macchiato', 42000, 3)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (23, N'Matcha Macchiato', 42000, 3)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (24, N'Trà Hoa Đậu Biếc Macchiato', 45000, 3)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (25, N'Trà Hương Vị', 35000, 3)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (26, N'Trà Matcha Latte', 55000, 3)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (27, N'Mocha Hạnh Nhân', 59000, 4)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (28, N'Toffee Hạnh Nhân Nóng', 59000, 4)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (29, N'Mojito Chanh Dây', 45000, 5)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (30, N'Mojito Chanh Tươi', 45000, 5)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (31, N'Soda Dâu Rừng', 45000, 5)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (32, N'Soda Việt Quất', 45000, 5)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (33, N'Soda Táo Xanh', 45000, 5)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (34, N'Nước Cam Tươi 100%', 65000, 5)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (35, N'Bánh Chuối ', 29000, 6)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (36, N'Mousse Cacao', 29000, 6)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (37, N'Phô Mai Trà Xanh ', 29000, 6)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (38, N'Phô Mai Caramel', 29000, 6)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (39, N'Phô Mai Cà Phê', 29000, 6)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (40, N'Chanh Đá Viên', 39000, 7)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (41, N'Tắc Đá Viên', 39000, 7)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (42, N'Quất Đá Viên', 39000, 7)
INSERT [dbo].[tblProduct] ([id_product], [name_product], [price], [id_category]) VALUES (43, N'Socola Nóng', 55000, 7)
SET IDENTITY_INSERT [dbo].[tblProduct] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblAccou__6E2DBEDED2119313]    Script Date: 6/18/2021 9:09:14 PM ******/
ALTER TABLE [dbo].[tblAccount] ADD UNIQUE NONCLUSTERED 
(
	[password] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblAccou__F3DBC572F9086074]    Script Date: 6/18/2021 9:09:14 PM ******/
ALTER TABLE [dbo].[tblAccount] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblCateg__7AC69D3D095FC186]    Script Date: 6/18/2021 9:09:14 PM ******/
ALTER TABLE [dbo].[tblCategory] ADD UNIQUE NONCLUSTERED 
(
	[name_category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblMembe__6E52856AEE55AD0B]    Script Date: 6/18/2021 9:09:14 PM ******/
ALTER TABLE [dbo].[tblMember] ADD UNIQUE NONCLUSTERED 
(
	[name_member] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblMembe__E18484D9ACA2D41D]    Script Date: 6/18/2021 9:09:14 PM ******/
ALTER TABLE [dbo].[tblMember] ADD UNIQUE NONCLUSTERED 
(
	[code_member] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblProdu__442C24E404F7F159]    Script Date: 6/18/2021 9:09:14 PM ******/
ALTER TABLE [dbo].[tblProduct] ADD UNIQUE NONCLUSTERED 
(
	[name_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblInvoice]  WITH CHECK ADD  CONSTRAINT [FK_tblInvoice_tblMember] FOREIGN KEY([code_member])
REFERENCES [dbo].[tblMember] ([code_member])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[tblInvoice] CHECK CONSTRAINT [FK_tblInvoice_tblMember]
GO
ALTER TABLE [dbo].[tblInvoiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblInvoiceDetail_tblInvoice] FOREIGN KEY([id_invoice])
REFERENCES [dbo].[tblInvoice] ([id])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[tblInvoiceDetail] CHECK CONSTRAINT [FK_tblInvoiceDetail_tblInvoice]
GO
ALTER TABLE [dbo].[tblInvoiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblInvoiceDetail_tblProduct] FOREIGN KEY([id_product])
REFERENCES [dbo].[tblProduct] ([id_product])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[tblInvoiceDetail] CHECK CONSTRAINT [FK_tblInvoiceDetail_tblProduct]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblCategory] FOREIGN KEY([id_category])
REFERENCES [dbo].[tblCategory] ([id_category])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblCategory]
GO
