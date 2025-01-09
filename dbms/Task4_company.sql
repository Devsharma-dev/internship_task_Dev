CREATE DATABASE company;



	USE company



	
		
Create Employees Table (Without DepartmentID Foreign Key Initially)		
		CREATE TABLE Employees (
    		EmployeeID INT PRIMARY KEY,
    		FirstName VARCHAR(50) NOT NULL,
    		LastName VARCHAR(50) NOT NULL,
    		Email VARCHAR(100) UNIQUE NOT NULL,
    		Phone VARCHAR(15),
    		HireDate DATE NOT NULL,
    		ManagerID INT,
    		Salary DECIMAL(10, 2) NOT NULL CHECK (Salary > 0),
    		FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
		);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, Phone, HireDate, ManagerID, Salary)
VALUES
(1, 'Raj', 'Sharma', 'raj.sharma@example.com', '9876543210', '2020-01-15', NULL, 50000.00),
(2, 'Aditi', 'Verma', 'aditi.verma@example.com', '9123456789', '2021-03-10', 1, 45000.00),
(3, 'Suresh', 'Patel', 'suresh.patel@example.com', '9345678912', '2019-05-20', 1, 60000.00),
(4, 'Priya', 'Iyer', 'priya.iyer@example.com', '9765432101', '2020-07-11', 2, 42000.00),
(5, 'Vikram', 'Reddy', 'vikram.reddy@example.com', '9101234567', '2022-06-25', 3, 55000.00),
(6, 'Neha', 'Singh', 'neha.singh@example.com', '9876123456', '2021-11-14', 2, 47000.00),
(7, 'Karan', 'Gupta', 'karan.gupta@example.com', '9765435678', '2018-08-30', 3, 72000.00),
(8, 'Anjali', 'Nair', 'anjali.nair@example.com', '9898765432', '2022-02-05', 4, 39000.00),
(9, 'Ravi', 'Kumar', 'ravi.kumar@example.com', '9753124680', '2021-09-19', 5, 54000.00),
(10, 'Sneha', 'Joshi', 'sneha.joshi@example.com', '9612345768', '2023-01-11', 6, 49000.00);


		CREATE TABLE Departments (
    		DepartmentID INT PRIMARY KEY,
    		DepartmentName VARCHAR(100) NOT NULL,
    		ManagerID INT,
    		FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
		);
	
    INSERT INTO Departments (DepartmentID, DepartmentName, ManagerID)
VALUES
(1, 'Human Resources', 1),  -- Raj Sharma manages the HR department
(2, 'Engineering', 3),      -- Suresh Patel manages the Engineering department
(3, 'Marketing', 2),        -- Aditi Verma manages the Marketing department
(4, 'Sales', 6),            -- Neha Singh manages the Sales department
(5, 'Finance', 7),          -- Karan Gupta manages the Finance department
(6, 'Product Management', 4),  -- Priya Iyer manages Product Management
(7, 'Customer Support', 5),    -- Vikram Reddy manages the Customer Support department
(8, 'Legal', 8),            -- Anjali Nair manages the Legal department
(9, 'IT Support', 9),       -- Ravi Kumar manages the IT Support department
(10, 'Operations', 10);     -- Sneha Joshi manages the Operations department

	
		ALTER TABLE Employees
		ADD DepartmentID INT,
		ADD FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);




		CREATE TABLE performanceReviews (ReviewID int AUTO_INCREMENT PRIMARY KEY,EmployeeID int,ReviewDate DATE ,PerformanceScore ENUM('Excellent','Good','Average','Poor'),Comments varchar(500),FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID));

	INSERT INTO performanceReviews (EmployeeID, ReviewDate, PerformanceScore, Comments)
VALUES
(1, '2023-12-15', 'Excellent', 'Raj Sharma has demonstrated exceptional leadership and problem-solving skills this year.'),
(2, '2023-11-20', 'Good', 'Aditi Verma has performed consistently well, with room for further growth in team coordination.'),
(3, '2023-10-05', 'Excellent', 'Suresh Patel has exceeded expectations, especially in project delivery and client satisfaction.'),
(4, '2023-09-30', 'Good', 'Priya Iyer’s performance has been solid, though some improvement is needed in time management.'),
(5, '2023-08-25', 'Average', 'Vikram Reddy met the basic requirements but could show more initiative in taking on new responsibilities.'),
(6, '2023-07-10', 'Good', 'Neha Singh has shown strong skills in team collaboration and achieving sales targets.'),
(7, '2023-06-18', 'Poor', 'Karan Gupta has faced several challenges in meeting targets this year, with a focus on improving his technical skills.'),
(8, '2023-05-27', 'Excellent', 'Anjali Nair has delivered outstanding results in legal compliance and regulatory matters.'),
(9, '2023-04-15', 'Good', 'Ravi Kumar’s performance is consistent, but he needs to work on communication skills for better client interactions.'),
(10, '2023-03-03', 'Average', 'Sneha Joshi has met most of her operational targets but needs to improve in project management efficiency.');


		CREATE TABLE PAYROLLS (PayrollID int AUTO_INCREMENT PRIMARY KEY,EmployeeID int,PaymentDate DATE,Amount decimal(10,2),PaymentMethod varchar(100),FOREIGN KEY (EmployeeID) REFERENCES employees (EmployeeID));

INSERT INTO PAYROLLS (EmployeeID, PaymentDate, Amount, PaymentMethod)
VALUES
(1, '2023-12-31', 50000.00, 'Bank Transfer'),   -- Raj Sharma
(2, '2023-11-30', 45000.00, 'Cheque'),           -- Aditi Verma
(3, '2023-10-31', 60000.00, 'Bank Transfer'),   -- Suresh Patel
(4, '2023-09-30', 42000.00, 'Bank Transfer'),   -- Priya Iyer
(5, '2023-08-31', 55000.00, 'Cash'),            -- Vikram Reddy
(6, '2023-07-31', 47000.00, 'Cheque'),          -- Neha Singh
(7, '2023-06-30', 72000.00, 'Bank Transfer'),   -- Karan Gupta
(8, '2023-05-31', 39000.00, 'Cash'),            -- Anjali Nair
(9, '2023-04-30', 54000.00, 'Bank Transfer'),   -- Ravi Kumar
(10, '2023-03-31', 49000.00, 'Cheque');         -- Sneha Joshi


-> Assignment Queries :-

 1. Retrieve the names and contact details of employees hired after January 1, 2023.

 - >  SELECT * FROM employees WHERE `HireDate`>'2023-01-01' 

 2. Find the total payroll amount paid to each department.

 - > SELECT e.DepartmentID,d.DepartmentName,SUM(p.Amount) TotalPayrollAmount FROM payroll p INNER JOIN employees e ON p.EmployeeID=e.EmployeeID INNER JOIN departments d ON e.DepartmentID=d.DepartmentID GROUP BY e.DepartmentID

 3. List all employees who have not been assigned a manager.

 - > SELECT * FROM employees WHERE ManagerID IS null

4. Retrieve the highest salary in each department along with the employee’s name.

 - > SELECT e.FirstName,e.LastName,MAX(e.Salary),e.DepartmentID,d.DepartmentName FROM employees e INNER JOIN departments d ON e.DepartmentID=d.DepartmentID GROUP BY DepartmentID

 5. Find the most recent performance review for each employee.

 - > SELECT p.EmployeeID,e.FirstName,e.LastName,MAX(p.ReviewDate)RecentPerformanceReviewDate FROM performancereviews p INNER JOIN employees e ON p.EmployeeID=e.EmployeeID GROUP BY p.EmployeeID

 6. Count the number of employees in each department.

 - >  SELECT d.DepartmentID,d.DepartmentName,COUNT(e.DepartmentID) NumberOfEmployee FROM employees e INNER JOIN departments d ON e.DepartmentID=d.DepartmentID GROUP BY e.DepartmentID

 7. List all employees who have received a performance score of "Excellent." 

 - > SELECT e.FirstName,e.LastName,p.PerformanceScore,p.Comments FROM employees e INNER JOIN performancereviews AS p ON e.EmployeeID=p.EmployeeID WHERE p.PerformanceScore="Excellent"

 8. Identify the most frequently used payment method in payroll.

 - > SELECT PaymentMethod MostFreuentlyPaymentMethod,COUNT(PaymentMethod)NumOfTimes FROM payroll GROUP BY PaymentMethod ORDER BY NumOfTimes DESC LIMIT 1

 9. Retrieve the top 5 highest-paid employees along with their departments.

 - > SELECT e.EmployeeID,e.FirstName,e.FirstName,e.Phone,e.Salary,d.DepartmentName FROM employees e INNER JOIN departments d ON e.DepartmentID=d.DepartmentID ORDER BY e.Salary DESC LIMIT 5

 10. Show details of all employees who report directly to a specific manager (e.g., ManagerID = 101)

 - > SELECT EmployeeID,FirstName,LastName,DepartmentID FROM employees WHERE ManagerID = 1
