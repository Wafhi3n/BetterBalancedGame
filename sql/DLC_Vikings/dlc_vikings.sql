-- Armagh
UPDATE Improvement_YieldChanges SET YieldChange=3 WHERE ImprovementType='IMPROVEMENT_MONASTERY' AND YieldType='YIELD_FAITH';

-- 15/12/22 Lysjefjord +2MP

INSERT INTO Modifiers(ModifierId, ModifierType) VALUES
    ('BBG_LYSEFJORD_GRANT_MOVEMENT_MODIFIER', 'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT');
INSERT INTO ModifierArguments(ModifierId, Name, Value) VALUES
    ('BBG_LYSEFJORD_GRANT_MOVEMENT_MODIFIER', 'Amount', '2');

INSERT INTO Types(Type, Kind) VALUES
    ('BBG_LYSEFJORD_GRANT_MOVEMENT_ABILITY', 'KIND_ABILITY');
INSERT INTO TypeTags(Type, Tag) VALUES
    ('BBG_LYSEFJORD_GRANT_MOVEMENT_ABILITY', 'CLASS_NAVAL_CARRIER'),
    ('BBG_LYSEFJORD_GRANT_MOVEMENT_ABILITY', 'CLASS_NAVAL_MELEE'),
    ('BBG_LYSEFJORD_GRANT_MOVEMENT_ABILITY', 'CLASS_NAVAL_RANGED'),
    ('BBG_LYSEFJORD_GRANT_MOVEMENT_ABILITY', 'CLASS_NAVAL_RAIDER');
INSERT INTO UnitAbilities(UnitAbilityType, Name, Description, Inactive, ShowFloatTextWhenEarned) VALUES
    ('BBG_LYSEFJORD_GRANT_MOVEMENT_ABILITY', 'LOC_BBG_LYSEFJORD_GRANT_MOVEMENT_ABILITY_NAME', 'LOC_BBG_LYSEFJORD_GRANT_MOVEMENT_ABILITY_DESC', 1, 1);
INSERT INTO UnitAbilityModifiers(UnitAbilityType, ModifierId) VALUES
    ('BBG_LYSEFJORD_GRANT_MOVEMENT_ABILITY', 'BBG_LYSEFJORD_GRANT_MOVEMENT_MODIFIER');

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
	('BBG_LYSEFJORD_GRANT_MOVEMENT_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
	('BBG_LYSEFJORD_GRANT_MOVEMENT_REQUIREMENTS', 'PLOT_ADJACENT_TO_LYSEFJORDEN_REQUIREMENT'),
	('BBG_LYSEFJORD_GRANT_MOVEMENT_REQUIREMENTS', 'UNIT_IS_NAVAL_REQUIREMENT');

INSERT INTO Modifiers (ModifierId, ModifierType, Permanent, OwnerRequirementSetId, SubjectRequirementSetId) VALUES
	('BBG_LYSEFJORD_GRANT_MOVEMENT', 'MODIFIER_ALL_UNITS_GRANT_ABILITY', 1, 'LYSEFJORDEN_REQUIREMENTS', 'BBG_LYSEFJORD_GRANT_MOVEMENT_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
	('BBG_LYSEFJORD_GRANT_MOVEMENT', 'AbilityType', 'BBG_LYSEFJORD_GRANT_MOVEMENT_ABILITY');

INSERT INTO GameModifiers (ModifierId) VALUES
	('BBG_LYSEFJORD_GRANT_MOVEMENT');

DELETE FROM Modifiers WHERE ModifierId='LYSEFJORDEN_GRANT_NAVAL_UNIT_EXPERIENCE';
DELETE FROM ModifierArguments WHERE ModifierId='LYSEFJORDEN_GRANT_NAVAL_UNIT_EXPERIENCE';
DELETE FROM RequirementSetRequirements WHERE RequirementSetId='LYSEFJORDEN_GRANT_EXPERIENCE_REQUIREMENTS';
DELETE FROM RequirementSets WHERE RequirementSetId='LYSEFJORDEN_GRANT_EXPERIENCE_REQUIREMENTS';

--Causeway +3 down from +5
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='SPEAR_OF_FIONN_ADJUST_COMBAT_STRENGTH' AND Name='Amount';
--ATTACKING_REQUIREMENT_SET depends on Persia Macedon, recreated
INSERT OR IGNORE INTO RequirementSets
	(RequirementSetId , RequirementSetType)
	VALUES
	('ATTACKING_REQUIREMENT_SET', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements
	(RequirementSetId , RequirementId)
	VALUES
	('ATTACKING_REQUIREMENT_SET', 'PLAYER_IS_ATTACKER_REQUIREMENTS');
UPDATE Modifiers SET SubjectRequirementSetId='ATTACKING_REQUIREMENT_SET' WHERE ModifierId='SPEAR_OF_FIONN_ADJUST_COMBAT_STRENGTH';