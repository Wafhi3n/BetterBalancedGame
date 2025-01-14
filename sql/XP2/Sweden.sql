--==================
-- Sweden
--==================
-- open air museum moved to diplo service
UPDATE Improvements SET PrereqCivic='CIVIC_DIPLOMATIC_SERVICE' WHERE ImprovementType='IMPROVEMENT_OPEN_AIR_MUSEUM';
-- +50% prod towards libraries, universities, workshops, and factories
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES
    ('TRAIT_CIVILIZATION_NOBEL_PRIZE', 'NOBEL_PRIZE_UNIVERISTY_BOOST'),
    ('TRAIT_CIVILIZATION_NOBEL_PRIZE', 'NOBEL_PRIZE_LIBRARY_BOOST'),
    ('TRAIT_CIVILIZATION_NOBEL_PRIZE', 'NOBEL_PRIZE_WORKSHOP_BOOST'),
    ('TRAIT_CIVILIZATION_NOBEL_PRIZE', 'NOBEL_PRIZE_FACTORY_BOOST');
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType) VALUES
    ('NOBEL_PRIZE_LIBRARY_BOOST', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION'),
    ('NOBEL_PRIZE_UNIVERISTY_BOOST', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION'),
    ('NOBEL_PRIZE_WORKSHOP_BOOST', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION'),
    ('NOBEL_PRIZE_FACTORY_BOOST', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES 
    ('NOBEL_PRIZE_LIBRARY_BOOST', 'BuildingType', 'BUILDING_LIBRARY'),
    ('NOBEL_PRIZE_LIBRARY_BOOST', 'Amount', '50'),
    ('NOBEL_PRIZE_UNIVERISTY_BOOST', 'BuildingType', 'BUILDING_UNIVERSITY'),
    ('NOBEL_PRIZE_UNIVERISTY_BOOST', 'Amount', '50'),
    ('NOBEL_PRIZE_WORKSHOP_BOOST', 'BuildingType', 'BUILDING_WORKSHOP'),
    ('NOBEL_PRIZE_WORKSHOP_BOOST', 'Amount', '50'),
    ('NOBEL_PRIZE_FACTORY_BOOST', 'BuildingType', 'BUILDING_FACTORY'),
    ('NOBEL_PRIZE_FACTORY_BOOST', 'Amount', '50');

-- Queens Bibliotheque can be build with other t2 gouv
DELETE FROM MutuallyExclusiveBuildings WHERE Building='BUILDING_QUEENS_BIBLIOTHEQUE' OR MutuallyExclusiveBuilding='BUILDING_QUEENS_BIBLIOTHEQUE';

-- 29/08/2021: +50% Production toward Gov plaza buildings
INSERT INTO Modifiers(ModifierId, ModifierType) VALUES
    ('BBG_SWEDEN_GOV_BUILDINGS_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION');
INSERT INTO ModifierArguments(ModifierId, Name, Value) VALUES
    ('BBG_SWEDEN_GOV_BUILDINGS_PRODUCTION', 'DistrictType', 'DISTRICT_GOVERNMENT'),
    ('BBG_SWEDEN_GOV_BUILDINGS_PRODUCTION', 'Amount', '50');
INSERT INTO TraitModifiers(TraitType, ModifierId) VALUES
    ('TRAIT_CIVILIZATION_NOBEL_PRIZE', 'BBG_SWEDEN_GOV_BUILDINGS_PRODUCTION');
