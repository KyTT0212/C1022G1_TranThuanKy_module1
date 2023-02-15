package service.impl;

import model.User;
import repository.IUserRepository;
import repository.impl.UserRepository;

import java.util.List;

public class UserService implements IUserRepository {
    IUserRepository userRepository = new UserRepository();

    @Override
    public void add(User user) {
        userRepository.add(user);
    }

    @Override
    public User findById(int id) {
        return userRepository.findById(id);
    }

    @Override
    public List<User> listAll() {
        return userRepository.listAll();
    }

    @Override
    public void delete(int id) {
        userRepository.delete(id);
    }

    @Override
    public void update(User user) {
        userRepository.update(user);
    }
}
