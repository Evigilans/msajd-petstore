package com.chtrembl.petstore.pet.api;

import com.chtrembl.petstore.pet.model.Pet;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@AllArgsConstructor
@Transactional
public class PetService {
	private final PetRepository petRepository;

	public List<Pet> findAllPets() {
		return (List<Pet>) petRepository.findAll();
	}
}
