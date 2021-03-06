if(keras_available()) {
  X_train <- matrix(rnorm(100 * 10), nrow = 100)
  Y_train <- to_categorical(matrix(sample(0:2, 100, TRUE), ncol = 1), 3)
  
  mod <- Sequential()
  mod$add(Dense(units = 50, input_shape = dim(X_train)[2]))
  mod$add(Activation("relu"))
  mod$add(Dense(units = 3))
  mod$add(Activation("softmax"))
  
  keras_compile(mod,  loss = 'categorical_crossentropy', optimizer = SGD())
  keras_fit(mod, X_train, Y_train, batch_size = 32, epochs = 5,
            verbose = 0, validation_split = 0.2)
  
  keras_compile(mod,  loss = 'categorical_crossentropy', optimizer = RMSprop())
  keras_fit(mod, X_train, Y_train, batch_size = 32, epochs = 5,
            verbose = 0, validation_split = 0.2)
  
  keras_compile(mod,  loss = 'categorical_crossentropy', optimizer = Adagrad())
  keras_fit(mod, X_train, Y_train, batch_size = 32, epochs = 5,
            verbose = 0, validation_split = 0.2)
  
  keras_compile(mod,  loss = 'categorical_crossentropy', optimizer = Adadelta())
  keras_fit(mod, X_train, Y_train, batch_size = 32, epochs = 5,
            verbose = 0, validation_split = 0.2)
  
  keras_compile(mod,  loss = 'categorical_crossentropy', optimizer = Adam())
  keras_fit(mod, X_train, Y_train, batch_size = 32, epochs = 5,
            verbose = 0, validation_split = 0.2)
  
  keras_compile(mod,  loss = 'categorical_crossentropy', optimizer = Adamax())
  keras_fit(mod, X_train, Y_train, batch_size = 32, epochs = 5,
            verbose = 0, validation_split = 0.2)
  
  keras_compile(mod,  loss = 'categorical_crossentropy', optimizer = Nadam())
  keras_fit(mod, X_train, Y_train, batch_size = 32, epochs = 5,
            verbose = 0, validation_split = 0.2)
}

