CREATE DATABASE PolyOE;
GO

USE PolyOE;
GO

CREATE TABLE [User] (
    Id NVARCHAR(20) PRIMARY KEY NOT NULL,
    [Password] NVARCHAR(50) NOT NULL,
    Fullname NVARCHAR(50) NOT NULL,
    Email NVARCHAR(255) NOT NULL,
    [Admin] BIT NOT NULL,
    CONSTRAINT UQ_User_Email UNIQUE (Email)
);
GO

CREATE TABLE Video (
    Id NVARCHAR(20) PRIMARY KEY NOT NULL,
    Title NVARCHAR(255) NOT NULL,
    Poster NVARCHAR(255) NOT NULL,
    [Views] INT NOT NULL,
    [Description] NVARCHAR(MAX) NOT NULL,
    Active BIT NOT NULL
);
GO

CREATE TABLE Favourite (
    Id BIGINT PRIMARY KEY NOT NULL,
    UserId NVARCHAR(20) NOT NULL,
    VideoId NVARCHAR(20) NOT NULL,
    LikeDate DATE NOT NULL,
    CONSTRAINT FK_Favourite_User FOREIGN KEY (UserId) REFERENCES [User](Id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_Favourite_Video FOREIGN KEY (VideoId) REFERENCES Video(Id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT UQ_Favourite_User_Video UNIQUE (UserId, VideoId)
);
GO

CREATE TABLE Share (
    Id BIGINT PRIMARY KEY NOT NULL,
    UserId NVARCHAR(20) NOT NULL,
    VideoId NVARCHAR(20) NOT NULL,
    Emails NVARCHAR(255) NOT NULL,
    ShareDate DATE NOT NULL,
    CONSTRAINT FK_Share_User FOREIGN KEY (UserId) REFERENCES [User](Id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_Share_Video FOREIGN KEY (VideoId) REFERENCES Video(Id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
GO

INSERT INTO [User] (Id, Password, Fullname, Email, Admin) 
VALUES ('user01', '123', 'Nguyễn Văn Tèo', 'teo@example.com', 0);

update  Users set Fullname = N'Nguyễn Văn Tèo' where  id = 'user01';

INSERT INTO Video (Id, Title, Poster, Views, Description, Active) 
VALUES ('vid01', 'Video title 1', '', 0, '', 1);

INSERT INTO Favourite (Id, UserId, VideoId, LikeDate) 
VALUES (1, 'user01', 'vid01', GETDATE());

EXEC sp_rename 'User', 'Users';
