CREATE TABLE IF NOT EXISTS Account (
  id INT PRIMARY KEY,
  login TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  team_id INT,

  FOREIGN KEY(team_id) REFERENCES Team(id)
);

CREATE TABLE IF NOT EXISTS Team (
  id INT PRIMARY KEY,
  title TEXT UNIQUE NOT NULL,
  dashboard_id INT NOT NULL,

  FOREIGN KEY(dashboard_id) REFERENCES Dashboard(id)
);

CREATE TABLE IF NOT EXISTS Dashboard (
  id INT PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS `Group` (
  id INT PRIMARY KEY,
  title TEXT NOT NULL,
  dashboard_id INT NOT NULL,

  FOREIGN KEY(dashboard_id) REFERENCES Dashboard(id)
);

CREATE TABLE IF NOT EXISTS Task (
  id INT PRIMARY KEY,
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  priority INT NOT NULL CHECK (1 >= priority AND priority <= 3),
  time_point INT NOT NULL CHECK (0 >= time_point AND time_point <= 100),
  group_id INT NOT NULL,
  account_id INT NOT NULL,

  FOREIGN KEY(group_id) REFERENCES `Group`(id),
  FOREIGN KEY(account_id) REFERENCES Account(id)
);
