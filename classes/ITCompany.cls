public class ITCompany {
    public static List<Human> onBoardEmployees() {
        List<Human> employees = new List<Human>();
    
        Human employee1 = (new Human('Prasath', 'raghul@company.com', 24, 'Male'));
        employee1.firstName='Raghul';
        employee1.isSmoker=false;
        employees.add(employee1);

        Human employee2 = (new Human('Dharshana', 'Dharshana@company.com', 23, 'Female'));
        employee1.firstName='R';
        employee1.isSmoker=false;
        employees.add(employee2);

        Human employee3 = (new Human('Varshini', 'Varshini@company.com', 22, 'Female'));
        employee1.firstName='R';
        employee1.isSmoker=false;
        employees.add(employee3);

        Human employee4 = (new Human('Narmadha', 'Narmadha@company.com', 24, 'Female'));
        employee1.firstName='R';
        employee1.isSmoker=false;
        employees.add(employee4);

        Human employee5 = (new Human('Kumar', 'Muthu@company.com', 24, 'male'));
        employee1.firstName='Muthu';
        employee1.isSmoker=false;
        employees.add(employee5);

        Human employee6 = (new Human('Kumar', 'Kumar@company.com', 26, 'male'));
        employee1.firstName='Arvind';
        employee1.isSmoker=false;
        employees.add(employee6);

        Human employee7 = (new Human('Keerthana', 'Keerthana@company.com', 22, 'Female'));
        employee1.firstName='K';
        employee1.isSmoker=false;
        employees.add(employee7);

        Human employee8 = (new Human('Mari', 'mari@company.com', 33, 'male'));
        employee1.firstName='M';
        employee1.isSmoker=false;
        employees.add(employee8);

        Human employee9 = (new Human('Lakshmi', 'Lakshmi@company.com', 20, 'Female'));
        employee1.firstName='Shri';
        employee1.isSmoker=false;
        employees.add(employee9);

        Human employee10 = (new Human('Kumar', 'Ashwin@company.com', 26, 'male'));
        employee1.firstName='Ashwin';
        employee1.isSmoker=false;
        employees.add(employee10);

        Human employee11 = (new Human('Baskaran', 'Harini@company.com', 19, 'Female'));
        employee1.firstName='Harini';
        employee1.isSmoker=false;
        employees.add(employee11);

        Human employee12 = (new Human('Ashwanth', 'Ashwanth@company.com', 26, 'male'));
        employee1.firstName='MD';
        employee1.isSmoker=false;
        employees.add(employee12);

        Human employee13 = (new Human('Sam', 'Sam@company.com', 22, 'male'));
        employee1.firstName='MD';
        employee1.isSmoker=false;
        employees.add(employee13);

        Human employee14 = (new Human('karan', 'Prabha@company.com', 36, 'male'));
        employee1.firstName='Prabha';
        employee1.isSmoker=false;
        employees.add(employee14);

        Human employee15 = (new Human('Sthephan', 'Regho@company.com', 31, 'male'));
        employee1.firstName='Regho';
        employee1.isSmoker=false;
        employees.add(employee15);

        Human employee16 = (new Human('lingam', 'siva@company.com', 22, 'male'));
        employee1.firstName='siva';
        employee1.isSmoker=false;
        employees.add(employee16);

        Human employee17 = (new Human('V', 'Vignesh@company.com', 26, 'male'));
        employee1.firstName='Vignesh';
        employee1.isSmoker=false;
        employees.add(employee17);

        Human employee18 = (new Human('Kohli', 'Yokesh@company.com', 25, 'male'));
        employee1.firstName='Yokesh';
        employee1.isSmoker=false;
        employees.add(employee18);

        Human employee19 = (new Human('Raina', 'Raina@company.com', 32, 'male'));
        employee1.firstName='Suresh';
        employee1.isSmoker=false;
        employees.add(employee19);

        Human employee20 = (new Human('Duplessis', 'Duplessis@company.com', 35, 'male'));
        employee1.firstName='Faf';
        employee1.isSmoker=true;
        employees.add(employee20);
    
        return employees;
        }

    public static List<Human> identifySuperHumans() {
        List<Human> employees = onBoardEmployees();
        String dayToday = ITCompanyUtility.giveMeTheDayToday();
        if (dayToday != null && dayToday.equals('Fri')) {
            for (Human employee : employees) {
                if (employee != null && employee.firstName != null && employee.lastName != null &&
                    (employee.firstName.startsWith('A') || employee.firstName.startsWith('M') ||
                     employee.firstName.startsWith('D') || employee.firstName.startsWith('P') ||
                     employee.firstName.startsWith('V')) ||
                    (employee.lastName.startsWith('A') || employee.lastName.startsWith('M') ||
                     employee.lastName.startsWith('D') || employee.lastName.startsWith('P') ||
                     employee.lastName.startsWith('V'))) {
                     employee.activateSuperHumanCapability();
                }
            }
        }
        return employees;
    }
}