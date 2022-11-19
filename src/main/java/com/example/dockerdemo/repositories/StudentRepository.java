package com.example.dockerdemo.repositories;

import com.example.dockerdemo.models.Student;
import org.springframework.data.repository.CrudRepository;

public interface StudentRepository extends CrudRepository<Student, Integer> {
}
