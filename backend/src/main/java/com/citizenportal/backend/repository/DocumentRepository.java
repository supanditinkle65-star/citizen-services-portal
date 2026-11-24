package com.citizenportal.backend.repository;

import com.citizenportal.backend.entity.Document;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DocumentRepository extends JpaRepository<Document, Long> {

    // "Show me all files for this application, in upload order"
    List<Document> findByApplicationIdOrderByUploadedAtAsc(Long applicationId);

    // "How many files does this application have?"
    long countByApplicationId(Long applicationId);
}