document.addEventListener('DOMContentLoaded', function() {
    loadEmployees();
});

function loadEmployees() {
    let employees = JSON.parse(localStorage.getItem('employees')) || [];
    const employeeList = document.getElementById('employeeList');
    employeeList.innerHTML = '';
    employees.forEach((employee, index) => {
        const card = document.createElement('div');
        card.className = 'employee-card';
        card.innerHTML = `
            <div>
                <label>Cédula:</label>
                <span>${employee.cedula}</span>
            </div>
            <div>
                <label>Nombres:</label>
                <span>${employee.firstName}</span>
            </div>
            <div>
                <label>Apellidos:</label>
                <span>${employee.lastName}</span>
            </div>
            <div>
                <label>Fecha de Nacimiento:</label>
                <span>${employee.birthDate}</span>
            </div>
            <div>
                <label>Departamento:</label>
                <span>${employee.department}</span>
            </div>
            <div>
                <label>Municipio:</label>
                <span>${employee.municipio}</span>
            </div>
            <div>
                <label>Dirección:</label>
                <span>${employee.address}</span>
            </div>
            <div>
                <label>Teléfono:</label>
                <span>${employee.phone}</span>
            </div>
            <div>
                <label>Celular:</label>
                <span>${employee.cellphone}</span>
            </div>
            <div>
                <label>Correo:</label>
                <span>${employee.email}</span>
            </div>
            <div>
                <label>Fecha de Ingreso:</label>
                <span>${employee.entryDate}</span>
            </div>
            <div>
                <label>Profesión:</label>
                <span>${employee.profession}</span>
            </div>
            <div>
                <label>Puesto:</label>
                <span>${employee.position}</span>
            </div>
            <div>
                <label>Salario:</label>
                <span>${employee.salary}</span>
            </div>
            <div class="actions">
                <button class="edit" onclick="editEmployee(${index})">Editar</button>
                <button class="delete" onclick="deleteEmployee(${index})">Eliminar</button>
            </div>
        `;
        employeeList.appendChild(card);
    });
}

function addOrUpdateEmployee() {
    const employeeId = document.getElementById('employeeId').value;
    const employee = {
        cedula: document.getElementById('cedula').value,
        firstName: document.getElementById('firstName').value,
        lastName: document.getElementById('lastName').value,
        birthDate: document.getElementById('birthDate').value,
        department: document.getElementById('department').value,
        municipio: document.getElementById('municipio').value,
        address: document.getElementById('address').value,
        phone: document.getElementById('phone').value,
        cellphone: document.getElementById('cellphone').value,
        email: document.getElementById('email').value,
        entryDate: document.getElementById('entryDate').value,
        profession: document.getElementById('profession').value,
        position: document.getElementById('position').value,
        salary: document.getElementById('salary').value
    };

    let employees = JSON.parse(localStorage.getItem('employees')) || [];

    if (employeeId === '') {
        employees.push(employee);
    } else {
        employees[employeeId] = employee;
    }

    localStorage.setItem('employees', JSON.stringify(employees));
    loadEmployees();
    document.getElementById('employeeForm').reset();
    document.getElementById('employeeId').value = '';
}

function editEmployee(index) {
    const employees = JSON.parse(localStorage.getItem('employees'));
    const employee = employees[index];

    document.getElementById('employeeId').value = index;
    document.getElementById('cedula').value = employee.cedula;
    document.getElementById('firstName').value = employee.firstName;
    document.getElementById('lastName').value = employee.lastName;
    document.getElementById('birthDate').value = employee.birthDate;
    document.getElementById('department').value = employee.department;
    document.getElementById('municipio').value = employee.municipio;
    document.getElementById('address').value = employee.address;
    document.getElementById('phone').value = employee.phone;
    document.getElementById('cellphone').value = employee.cellphone;
    document.getElementById('email').value = employee.email;
    document.getElementById('entryDate').value = employee.entryDate;
    document.getElementById('profession').value = employee.profession;
    document.getElementById('position').value = employee.position;
    document.getElementById('salary').value = employee.salary;
}

function deleteEmployee(index) {
    let employees = JSON.parse(localStorage.getItem('employees'));
    employees.splice(index, 1);
    localStorage.setItem('employees', JSON.stringify(employees));
    loadEmployees();
}
