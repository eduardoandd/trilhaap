class expTeacherRepository{
  List<String> GetExpLevels(){
    return [
      'Beginner',      // Básico
      'Elementary',    // Elementar (um pouco acima de básico)
      'Intermediate',  // Intermediário
      'Upper-Intermediate', // Intermediário avançado
      'Advanced',      // Avançado
      'Proficient',    // Proficiente
      'Expert'         // Especialista
    ];
  }
}