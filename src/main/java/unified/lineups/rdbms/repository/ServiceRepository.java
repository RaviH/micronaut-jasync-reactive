package unified.lineups.rdbms.repository;

import io.micronaut.data.annotation.Repository;
import io.micronaut.data.repository.CrudRepository;
import io.micronaut.data.repository.reactive.RxJavaCrudRepository;
import io.reactivex.Maybe;
import unified.lineups.rdbms.entity.Service;

import java.util.List;

@Repository
public interface ServiceRepository extends RxJavaCrudRepository<Service, Long> {

    Maybe<Service> findByTmsId(String tmsId);
}
