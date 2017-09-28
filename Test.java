import com.example.tutorial.AddressBookProtos.*;

public class Test {
    public static void main(String[] args) {
        System.out.println("test");

        Person john =
              Person.newBuilder()
                  .setId(1234)
                      .setName("John Doe")
                          .setEmail("jdoe@example.com")
                              .addPhones(Person.PhoneNumber.newBuilder()
                                  .setNumber("555-4321")
                                      .setType(Person.PhoneType.HOME))
                                          .build();

        System.out.println(john.getName());
    }
}
