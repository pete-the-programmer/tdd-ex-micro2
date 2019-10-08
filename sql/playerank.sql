-- clear
IF OBJECT_ID('Player') IS NOT NULL DROP TABLE Player;
IF OBJECT_ID('PlayerStatus') IS NOT NULL DROP TABLE PlayerStatus;

-- reference tables
CREATE TABLE PlayerStatus (id INT PRIMARY KEY, label NVARCHAR(25));
INSERT INTO PlayerStatus VALUES (1, 'NEWBIE');
INSERT INTO PlayerStatus VALUES (2, 'STANDARD');
INSERT INTO PlayerStatus VALUES (3, 'ELITE');
INSERT INTO PlayerStatus VALUES (4, 'SPONSORED');

-- Data

CREATE TABLE Player (
    id INT PRIMARY KEY,
    lastPlayed DATETIME,
    playerStatus INT,
    FOREIGN KEY (playerStatus) REFERENCES PlayerStatus(id)
)

-- Program

IF OBJECT_ID('ComparePlayers') IS NOT NULL DROP FUNCTION ComparePlayers;
GO
CREATE FUNCTION dbo.ComparePlayers(@player1 INT, @player2 INT)
RETURNS INT
AS
BEGIN
    -- Check inputs
    IF  (NOT EXISTS (SELECT 1 FROM Player WHERE id = @player1)) OR
        (NOT EXISTS (SELECT 1 FROM Player WHERE id = @player2))
            RETURN CAST('One of the specified players do not exist' AS INT)

    -- test 1
    IF @player1 = @player2
        RETURN 0;
    
    --test 2
    DECLARE @status1 INT;
    DECLARE @status2 INT;
    SELECT @status1=playerStatus FROM Player WHERE id = @player1
    SELECT @status2=playerStatus FROM Player WHERE id = @player2
    IF @status1 <> @status2
        RETURN (CASE WHEN (@status1 < @status2) THEN -1 ELSE 1 END);

    -- test 3
    DECLARE @lastPlayed1 DATETIME;
    DECLARE @lastPlayed2 DATETIME;
    SELECT @lastPlayed1=lastPlayed FROM Player WHERE id = @player1
    SELECT @lastPlayed2=lastPlayed FROM Player WHERE id = @player2
    IF @lastPlayed1 <> @lastPlayed2
        RETURN (CASE WHEN (@lastPlayed1 < @lastPlayed2) THEN -1 ELSE 1 END);

    --falback case
    RETURN (CASE WHEN (@player1 < @player2) THEN -1 ELSE 1 END);
END
GO


