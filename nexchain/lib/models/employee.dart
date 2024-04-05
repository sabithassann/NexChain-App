

class Employee {
  final String name;
  final String image;
  final String position;
  final String email;

  Employee({required this.name, required this.image, required this.position, required this.email});
}

List<Employee> employees = [
  Employee(
    name: 'Sabit',
    image: 'sabit1.png',
    position: 'Software Engineer',
    email: 'sabit@example.com',
  ),
  Employee(
    name: 'Tameem',
    image: 'tameem.png',
    position: 'UI/UX Designer',
    email: 'tameem@example.com',
  ),
  Employee(
    name: 'Masud',
    image: 'masud.png',
    position: 'Backend Developer',
    email: 'masud@example.com',
  ),
];