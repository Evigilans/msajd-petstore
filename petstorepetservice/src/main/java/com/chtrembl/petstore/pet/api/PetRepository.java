package com.chtrembl.petstore.pet.api;

import com.chtrembl.petstore.pet.model.Pet;
import org.springframework.data.repository.CrudRepository;

public interface PetRepository extends CrudRepository<Pet, String> {
}
