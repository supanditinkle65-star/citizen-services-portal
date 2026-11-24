package com.citizenportal.backend.repository;

import com.citizenportal.backend.entity.Application;
import com.citizenportal.backend.entity.ApplicationStatus;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ApplicationRepository extends JpaRepository<Application, Long> {

    // Citizen: "show me MY applications, newest first"
    List<Application> findByApplicantIdOrderByCreatedAtDesc(Long applicantId);

    // Officer: "show me all applications with this status, oldest first"
    List<Application> findByStatusOrderByCreatedAtAsc(ApplicationStatus status);

    // Anyone: "track my application by its reference number"
    Optional<Application> findByReferenceNo(String referenceNo);
}