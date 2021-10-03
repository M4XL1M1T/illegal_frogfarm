INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES

('cooking_pot', 'Kochtopf', 1, 0, 1),
('earthworm', 'Tauwurm', 1, 0, 1),
('fish_raw', 'Roher Fisch', 1, 0, 1),
('frog_bone', 'Kröten Knochen', 1, 0, 1),
('frog_cooked', 'Kröten Hautsekret', 1, 0, 1),
('frog_drug', 'Kröten Bufotenin', 1, 0, 1),
('frog_guts', 'Kröten Innereien ', 1, 0, 1),
('frog_pet', 'Aga-Kröte', 1, 0, 1),
('frog_preprocessed', 'Sezierte Kröte', 1, 0, 1),

--
ALTER TABLE `items`
  ADD PRIMARY KEY (`name`);
COMMIT;
