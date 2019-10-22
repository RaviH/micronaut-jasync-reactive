package unified.lineups.rdbms.rest;

import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;
import io.micronaut.http.annotation.Post;
import io.micronaut.http.annotation.QueryValue;
import io.reactivex.Flowable;
import io.reactivex.Maybe;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import uk.co.jemos.podam.api.PodamFactoryImpl;
import unified.lineups.rdbms.entity.Service;
import unified.lineups.rdbms.repository.ServiceRepository;
import unified.lineups.rdbms.util.DataGenerator;
import unified.lineups.rdbms.util.SomeService;

import javax.inject.Singleton;
import java.util.concurrent.CompletableFuture;

@Singleton
@AllArgsConstructor
@Controller("/unifiedlineups/v1/lineups")
@Slf4j
public class LineupRS {

    private DataGenerator dataGenerator;
    private SomeService someService;
    private ServiceRepository serviceRepository;

    @Post("/generate")
    public Flowable<String> generate() {

        dataGenerator.generate();
        return Flowable.just("Success");
    }

    @Get
    public Maybe<Service> findByTmsId(
            @QueryValue
            final String tmsId
    ) {

        return serviceRepository.findByTmsId(tmsId);
    }
}
